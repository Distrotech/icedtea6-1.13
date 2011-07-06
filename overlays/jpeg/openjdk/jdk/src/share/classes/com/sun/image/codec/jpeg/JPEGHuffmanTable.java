/* JPEGHuffmanTable.java -- Huffman table implementation for JPEG.
Copyright (C) 2011 Red Hat

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

package com.sun.image.codec.jpeg;

/**
 * A class to encapsulate a JPEG Huffman table.
 */
public class JPEGHuffmanTable extends
        javax.imageio.plugins.jpeg.JPEGHuffmanTable {

    /**
     * The standard DC luminance Huffman table.
     */
    public static final JPEGHuffmanTable StdDCLuminance;

    /**
     * The standard DC chrominance Huffman table.
     */
    public static final JPEGHuffmanTable StdDCChrominance;

    /**
     * The standard AC luminance Huffman table.
     */
    public static final JPEGHuffmanTable StdACLuminance;

    /**
     * The standard AC chrominance Huffman table.
     */
    public static final JPEGHuffmanTable StdACChrominance;

    static {
        javax.imageio.plugins.jpeg.JPEGHuffmanTable temp = javax.imageio.plugins.jpeg.JPEGHuffmanTable.StdDCLuminance;
        StdDCLuminance = new JPEGHuffmanTable(temp.getLengths(),
                temp.getValues());

        temp = javax.imageio.plugins.jpeg.JPEGHuffmanTable.StdDCChrominance;
        StdDCChrominance = new JPEGHuffmanTable(temp.getLengths(),
                temp.getValues());

        temp = javax.imageio.plugins.jpeg.JPEGHuffmanTable.StdACLuminance;
        StdACLuminance = new JPEGHuffmanTable(temp.getLengths(),
                temp.getValues());

        temp = javax.imageio.plugins.jpeg.JPEGHuffmanTable.StdACChrominance;
        StdACChrominance = new JPEGHuffmanTable(temp.getLengths(),
                temp.getValues());
    }

    /**
     * Creates a Huffman table and initializes it. The input arrays are copied.
     * The arrays must describe a possible Huffman table. For example, 3 codes
     * cannot be expressed with a single bit.
     *
     * @param lengths
     *            an array of {@code short}s where <code>lengths[k]</code> is
     *            equal to the number of values with corresponding codes of
     *            length <code>k + 1</code> bits.
     * @param values
     *            an array of shorts containing the values in order of
     *            increasing code length.
     * @throws IllegalArgumentException
     *             if <code>lengths</code> or <code>values</code> are null, the
     *             length of <code>lengths</code> is greater than 16, the length
     *             of <code>values</code> is greater than 256, if any value in
     *             <code>lengths</code> or <code>values</code> is less than
     *             zero, or if the arrays do not describe a valid Huffman table.
     */
    public JPEGHuffmanTable(short lengths[], short symbols[]) {
        super(lengths, symbols);
    }

    /**
     * Return an array containing the Huffman symbols arranged by increasing
     * length. To make use of this array you must refer the the lengths array.
     *
     * @return A short array of Huffman symbols
     */
    public short[] getSymbols() {
        return getValues();
    }
}
