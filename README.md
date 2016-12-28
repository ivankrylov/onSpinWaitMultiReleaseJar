# onSpinWaitMultiReleaseJar

This makefile builds a jar that works with and JDK from 6 to 9 (and beyond).
Just add this jar to the classpath and insert ThreadHints.onSpinWait() whereever you have a busy loop.

There is a simple example that you can use as a depo and also PrintAssembly to verify that the pause instruction is indeed being used (Your would need a Hotspot Disassembler for a proper print).

On my TODO list: convert this Makefile into a maven build.
