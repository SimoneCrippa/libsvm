CXX ?= g++
AM_CFLAGS = -Wall -Wconversion -O3 -fPIC
OS = $(shell uname)

all: svm.o lib

lib: svm.o
	if [ "$(OS)" = "Darwin" ]; then \
		SHARED_LIB_FLAG="-dynamiclib -Wl,-install_name,libsvm.so.2"; \
	else \
		SHARED_LIB_FLAG="-shared -Wl,-soname,libsvm.so.2"; \
	fi; \
	$(CXX) $${SHARED_LIB_FLAG} svm.o -o libsvm.so.2

svm.o: svm.cpp svm.h
	$(CXX) $(AM_CFLAGS) -c svm.cpp
clean:
	rm -f *~ svm.o libsvm.so.2


libsvmincludedir = $(includedir)/svm
libsvminclude_HEADERS = svm.h

lib_LTLIBRARIES = libsvm.la

libsvm_la_SOURCES = \
        svm.cpp \
        svm.h 