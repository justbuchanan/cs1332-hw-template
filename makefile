# Replace this with your main class name
DRIVER=MyJavaClassWithMainMethod

# Use all .java files in the directory
SRC=$(wildcard *.java)
OBJ=$(patsubst %.java, %.class, $(SRC))

# This list of files is included in the pkg.zip output for uploading to T-Square
# If you want to upload more than just the .java files, add them here
PKG_FILES=$(SRC)

all: $(OBJ)

run: all
	java $(DRIVER)

debug: all
	jdb $(DRIVER)

pkg: $(PKG_FILES)
	zip pkg.zip $(PKG_FILES)

%.class: %.java
	javac $^

clean:
	rm $(OBJ) pkg.zip
