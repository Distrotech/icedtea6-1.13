/*
 * Copyright 2007-2008 Sun Microsystems, Inc.  All Rights Reserved.
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This code is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 2 only, as
 * published by the Free Software Foundation.  Sun designates this
 * particular file as subject to the "Classpath" exception as provided
 * by Sun in the LICENSE file that accompanied this code.
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

#include "jni.h"
#include "jni_util.h"
#include "jvm.h"
#include "jlong.h"

#include <stdlib.h>
#include <dlfcn.h>
#include <sys/types.h>

#include "sun_nio_fs_SolarisWatchService.h"

/*
 * Definitions from sys/port.h to allow build on pre-Solaris 10 machines.
 */
typedef struct my_port_event {
        int             portev_events;  /* event data is source specific */
        ushort_t        portev_source;  /* event source */
        ushort_t        portev_pad;     /* port internal use */
        uintptr_t       portev_object;  /* source specific object */
        void            *portev_user;   /* user cookie */
} my_port_event_t;

typedef int port_create_func(void);
typedef int port_associate_func(int port, int source, uintptr_t object, int events, void* user);
typedef int port_dissociate_func(int port, int source, uintptr_t object);
typedef int port_send_func(int port, int events, void* user);
typedef int port_getn_func(int port, my_port_event_t list[], uint_t max, uint_t* nget,
    const timespec_t* timeout);

static port_create_func* my_port_create_func = NULL;
static port_associate_func* my_port_associate_func = NULL;
static port_dissociate_func* my_port_dissociate_func = NULL;
static port_send_func* my_port_send_func = NULL;
static port_getn_func* my_port_getn_func = NULL;

static void throwUnixException(JNIEnv* env, int errnum) {
    jobject x = JNU_NewObjectByName(env, "sun/nio/fs/UnixException",
        "(I)V", errnum);
    if (x != NULL) {
        (*env)->Throw(env, x);
    }
}

JNIEXPORT void JNICALL
Java_sun_nio_fs_SolarisWatchService_init(JNIEnv *env, jclass clazz)
{
    my_port_create_func = (port_create_func*)dlsym(RTLD_DEFAULT, "port_create");
    my_port_associate_func = (port_associate_func*)dlsym(RTLD_DEFAULT, "port_associate");
    my_port_dissociate_func = (port_dissociate_func*)dlsym(RTLD_DEFAULT, "port_dissociate");
    my_port_send_func = (port_send_func*)dlsym(RTLD_DEFAULT, "port_send");
    my_port_getn_func = (port_getn_func*)dlsym(RTLD_DEFAULT, "port_getn");

    if (my_port_create_func == NULL ||
        my_port_associate_func == NULL ||
        my_port_dissociate_func == NULL ||
        my_port_send_func == NULL ||
        my_port_getn_func == NULL)
    {
        JNU_ThrowInternalError(env, "unable to get address of port functions");
    }
}

JNIEXPORT jint JNICALL
Java_sun_nio_fs_SolarisWatchService_portCreate
    (JNIEnv* env, jclass clazz)
{
    int port = (*my_port_create_func)();
    if (port == -1) {
        throwUnixException(env, errno);
    }
    return (jint)port;
}

JNIEXPORT void JNICALL
Java_sun_nio_fs_SolarisWatchService_portAssociate
    (JNIEnv* env, jclass clazz, jint port, jint source, jlong objectAddress, jint events)
{
    uintptr_t object = (uintptr_t)jlong_to_ptr(objectAddress);

    if ((*my_port_associate_func)((int)port, (int)source, object, (int)events, NULL) == -1) {
        throwUnixException(env, errno);
    }
}

JNIEXPORT void JNICALL
Java_sun_nio_fs_SolarisWatchService_portDissociate
    (JNIEnv* env, jclass clazz, jint port, jint source, jlong objectAddress)
{
    uintptr_t object = (uintptr_t)jlong_to_ptr(objectAddress);

    if ((*my_port_dissociate_func)((int)port, (int)source, object) == -1) {
        throwUnixException(env, errno);
    }
}

JNIEXPORT void JNICALL
Java_sun_nio_fs_SolarisWatchService_portSend(JNIEnv* env, jclass clazz,
    jint port, jint events)
{
    if ((*my_port_send_func)((int)port, (int)events, NULL) == -1) {
        throwUnixException(env, errno);
    }
}

JNIEXPORT jint JNICALL
Java_sun_nio_fs_SolarisWatchService_portGetn(JNIEnv* env, jclass clazz,
    jint port, jlong arrayAddress, jint max)
{
    uint_t n = 1;
    my_port_event_t* list = (my_port_event_t*)jlong_to_ptr(arrayAddress);

    if( (*my_port_getn_func)((int)port, list, (uint_t)max, &n, NULL) == -1) {
        throwUnixException(env, errno);
    }
    return (jint)n;
}