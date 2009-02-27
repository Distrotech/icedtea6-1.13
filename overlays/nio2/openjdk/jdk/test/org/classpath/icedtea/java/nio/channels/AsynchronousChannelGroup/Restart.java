/*
 * Copyright 2007-2008 Sun Microsystems, Inc.  All Rights Reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.
 *
 * This code is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
 * version 2 for more details (a copy is included in the LICENSE file that
 * accompanied this code).
 *
 * You should have received a copy of the GNU General Public License version
 * 2 along with this work; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
 *
 * Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
 * CA 95054 USA or visit www.sun.com if you need additional information or
 * have any questions.
 */

/* @test
 * @bug 4607272
 * @summary Unit test for AsynchronousChannelGroup
 * @build Restart
 * @run main/othervm -XX:-UseVMInterruptibleIO Restart
 */

import java.nio.channels.*;
import java.net.*;
import java.util.*;
import java.util.concurrent.*;
import java.util.concurrent.atomic.*;
import java.io.IOException;

/**
 * Exercise replacement of threads in the thread pool when completion handlers
 * terminate due to errors or runtime exceptions.
 */

public class Restart {
    static final Random rand = new Random();

    public static void main(String[] args) throws Exception {
        // thread group for thread pools
        final ThreadGroup tg = new ThreadGroup("test");

        // keep track of the number of threads that terminate
        final AtomicInteger exceptionCount = new AtomicInteger(0);
        final Thread.UncaughtExceptionHandler ueh =
            new Thread.UncaughtExceptionHandler() {
                public void uncaughtException(Thread t, Throwable e) {
                    exceptionCount.incrementAndGet();
                }
            };
        ThreadFactory factory = new ThreadFactory() {

            public Thread newThread(Runnable r) {
                Thread t = new Thread(tg, r);
                t.setUncaughtExceptionHandler(ueh);
                return t;
            }
        };

        // group with fixed thread pool
        int nThreads = 1 + rand.nextInt(4);
        ExecutorService pool = Executors.newFixedThreadPool(nThreads, factory);
        AsynchronousChannelGroup group =
            AsynchronousChannelGroup.withFixedThreadPool(pool, nThreads);
        testRestart(group, 100);
        group.shutdown();

        // group with thread pool created automatically
        pool = Executors.newCachedThreadPool(factory);
        group = AsynchronousChannelGroup.withCachedThreadPool(pool, rand.nextInt(5));
        testRestart(group, 100);
        group.shutdown();

        // give time for threads to terminate
        Thread.sleep(3000);
        int actual = exceptionCount.get();
        if (actual != 200)
            throw new RuntimeException(actual + " exceptions, expected: " + 200);
    }

    static void testRestart(AsynchronousChannelGroup group, int count)
        throws Exception
    {
        AsynchronousServerSocketChannel listener =
            AsynchronousServerSocketChannel.open(group)
                .bind(new InetSocketAddress(0));

        for (int i=0; i<count; i++) {
            final CountDownLatch latch = new CountDownLatch(1);

            listener.accept(null, new CompletionHandler<AsynchronousSocketChannel,Void>() {
                public void completed(AsynchronousSocketChannel ch, Void att) {
                    try {
                        ch.close();
                    } catch (IOException ignore) { }

                    latch.countDown();

                    // throw error or runtime exception
                    if (rand.nextBoolean()) {
                        throw new Error();
                    } else {
                        throw new RuntimeException();
                    }
                }
                public void failed(Throwable exc, Void att) {
                }
                public void cancelled(Void att) {
                }
            });

            // establish loopback connection which should cause completion
            // handler to be invoked.
            int port = ((InetSocketAddress)(listener.getLocalAddress())).getPort();
            AsynchronousSocketChannel ch = AsynchronousSocketChannel.open();
            InetAddress lh = InetAddress.getLocalHost();
            ch.connect(new InetSocketAddress(lh, port)).get();
            ch.close();

            // wait for handler to be invoked
            latch.await();
        }

        // clean-up
        listener.close();
    }
}