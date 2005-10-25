PACKAGE	= inetd
VERSION	= 0.0.0
SUBDIRS	= src
TAR	= tar cfzv


all: subdirs

subdirs:
	@for i in $(SUBDIRS); do (cd $$i && $(MAKE)) || exit; done

clean:
	@for i in $(SUBDIRS); do (cd $$i && $(MAKE) clean) || exit; done

distclean:
	@for i in $(SUBDIRS); do (cd $$i && $(MAKE) distclean) || exit; done

dist: distclean
	@$(TAR) $(PACKAGE)-$(VERSION).tar.gz \
		src/config.c \
		src/parser.c \
		src/scanner.c \
		src/service.c \
		src/token.c \
		src/inetd.c \
		src/discard.c \
		src/echo.c \
		src/config.h \
		src/inetd.h \
		src/parser.h \
		src/scanner.h \
		src/service.h \
		src/token.h \
		src/project.conf \
		src/Makefile \
		project.conf \
		Makefile
install: all
	@for i in $(SUBDIRS); do (cd $$i && $(MAKE) install) || exit; done
