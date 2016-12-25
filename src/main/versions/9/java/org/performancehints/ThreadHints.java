/*
 * Written by Gil Tene, and released to the public domain,
 * as explained at http://creativecommons.org/publicdomain/zero/1.0/
 */

package org.performancehints;

/**
 * This class captures possible performance hints that may be used by some
 * runtimes to improve code performance. It is intended to capture hinting
 * behaviors that are implemented in or anticipated to be spec'ed under the
 * java.lang.Thread class in some Java SE versions, but missing in prior
 * versions.
 */

public final class ThreadHints {

    // prevent construction...
    private ThreadHints() {
    }

    /**
     * Indicates that the caller is momentarily unable to progress, until the
     * occurrence of one or more actions on the part of other activities.  By
     * invoking this method within each iteration of a spin-wait loop construct,
     * the calling thread indicates to the runtime that it is busy-waiting. The runtime
     * may take action to improve the performance of invoking spin-wait loop
     * constructions.
     * Thanks to JEP-285, there is a method for this purpose in the java.base module
     */
    public static void onSpinWait() {
      java.lang.Thread.onSpinWait();
    }
}
