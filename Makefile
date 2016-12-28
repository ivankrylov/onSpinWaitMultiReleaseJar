#
# "Multi-Release jar" version written by Ivan Krylov, released to the public domain,
# as explained at http://creativecommons.org/publicdomain/zero/1.0/
#

JDK8 := $(shell /usr/libexec/java_home -v 8)
JDK9 := $(shell /usr/libexec/java_home -v 9)

BUILD_DIR=build
TEST_DIR=test

build6: ./src/main/versions/6/java/org/performancehints/ThreadHints.java
	mkdir -p ${BUILD_DIR}/META-INF/versions/6
	${JDK9}/bin/javac --release 6 -sourcepath ./src/main/versions/6 -d ${BUILD_DIR} ./src/main/versions/6/java/org/performancehints/ThreadHints.java

build9: ./src/main/versions/9/java/org/performancehints/ThreadHints.java
	mkdir -p ${BUILD_DIR}/META-INF/versions/9
	${JDK9}/bin/javac -sourcepath ./src/main/versions/9 -d ${BUILD_DIR}/META-INF/versions/9 ./src/main/versions/9/java/org/performancehints/ThreadHints.java

buildall: build6 build9

buildtest: ./src/test/TestOnSpinWait.java
	mkdir -p ${TEST_DIR}
	${JDK9}/bin/javac --release 6 -cp org-performancehints.jar -sourcepath ./src/test -d ${TEST_DIR} ./src/test/TestOnSpinWait.java

package: buildall
	${JDK9}/bin/jar --create --file org-performancehints.jar --manifest MANIFEST.MF -C build .

run: package buildtest
	@echo With JDK8
	${JDK8}/bin/java -showversion -cp org-performancehints.jar:${TEST_DIR} TestOnSpinWait
	@echo With JDK9
	${JDK9}/bin/java -showversion -cp org-performancehints.jar:${TEST_DIR} TestOnSpinWait
