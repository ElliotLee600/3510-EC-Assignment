BIN=runcpp
JAVADIR=parsers/java

${BIN}: parsers/cpp/*.cpp parsers/cpp/*.h src/Solutions.cpp
	g++ -std=c++17 -g -o ${BIN} parsers/cpp/run.cpp src/Solutions.cpp

.PHONY: java
java: parsers/java/run.class
	@java -classpath parsers/java run ${ARGS}

.PHONY: clean
clean:
	rm ${BIN} parsers/java/*.class

${JAVADIR}/run.class: ${JAVADIR}/*.java src/Solutions.java
	cd ${JAVADIR} && javac run.java

