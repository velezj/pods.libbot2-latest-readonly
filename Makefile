
FETCH_URL=http://libbot.googlecode.com/svn/

default_target=all


all: libbot2-svn-latest-readonly/Makefile
	cd libbot2-svn-latest-readonly/ && $(MAKE) 

libbot2-svn-latest-readonly/Makefile:
	svn co $(FETCH_URL) libbot2-svn-latest-readonly

# foward all make commands to the libbot svn PODS
%::
	cd libbot2-svn-latest-readonly/ && $(MAKE) $@
