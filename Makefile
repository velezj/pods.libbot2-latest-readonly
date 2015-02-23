
FETCH_URL=http://libbot.googlecode.com/svn/trunk/

default_target=all


all: libbot2-svn-latest-readonly/Makefile
	cd libbot2-svn-latest-readonly/ && $(MAKE) 

libbot2-svn-latest-readonly/Makefile:
	svn co $(FETCH_URL) libbot2-svn-latest-readonly

dist-clean:
	cd libbot2-svn-latest-readonly/ && $(MAKE) clean
	rm -rf libbot2-svn-latest-readonly/

# foward all make commands to the libbot svn PODS
%::
	cd libbot2-svn-latest-readonly/ && $(MAKE) $@
