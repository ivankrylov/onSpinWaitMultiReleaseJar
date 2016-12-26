# onSpinWaitMultiReleaseJar

This makefile builds a jar that works with and JDK from 6 to 9 (and beyond).
Just add this jar to the classpath and insert ThreadHints.onSpinWait() whereever you have a busy loop.

On my TODO list: convert this Makefile into a maven build.
