# Replace this with your main class name
DRIVER=MyJavaClassWithMainMethod

# Replace this with the class that contains all of your tests
TEST_CLASS=MyTestClass

# Use all .java files in the directory
SRC=$(wildcard *.java)
OBJ=$(patsubst %.java, %.class, $(SRC))

# This list of files is included in the pkg.zip output for uploading to T-Square
# If you want to upload more than just the .java files, add them here
PKG_FILES=$(SRC)

# class path
# note: you may need to add the path to junit.jar here
CLASSPATH="junit-4.11.jar:hamcrest-core-1.3.jar:."

all: $(OBJ)

run: all
	java -cp $(CLASSPATH) $(DRIVER)

debug: all
	jdb -cp $(CLASSPATH) $(DRIVER)

test: all
	java -cp $(CLASSPATH) org.junit.runner.JUnitCore $(TEST_CLASS)

pkg: $(PKG_FILES)
	zip pkg.zip $(PKG_FILES)

%.class: %.java
	javac -cp $(CLASSPATH) $^

clean:
	rm $(OBJ) pkg.zip
