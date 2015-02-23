
FETCH_URL=http://libbot.googlecode.com/svn/trunk/

# Figure out where to build the software.
#   Use BUILD_PREFIX if it was passed in.
#   If not, search up to three parent directories for a 'build' directory.
#   Otherwise, use ./build.
ifeq "$(BUILD_PREFIX)" ""
BUILD_PREFIX=$(shell for pfx in ./ .. ../.. ../../..; do d=`pwd`/$$pfx/build; \
               if [ -d $$d ]; then echo $$d; exit 0; fi; done; echo `pwd`/build)
endif


default_target=all

all: libbot2-svn-latest-readonly/Makefile
	cd libbot2-svn-latest-readonly/ && BUILD_PREFIX=$(BUILD_PREFIX) $(MAKE) 

libbot2-svn-latest-readonly/Makefile:
	svn co $(FETCH_URL) libbot2-svn-latest-readonly

dist-clean:
	cd libbot2-svn-latest-readonly/ && $(MAKE) clean
	rm -rf libbot2-svn-latest-readonly/

# foward all make commands to the libbot svn PODS
%::
	cd libbot2-svn-latest-readonly/ && $(MAKE) $@
