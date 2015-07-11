TARGETS	= $(OBJDIR)inetd $(OBJDIR)discard $(OBJDIR)echo
OBJDIR	=
PREFIX	= /usr/local
DESTDIR	=
BINDIR	= $(PREFIX)/bin
SBINDIR	= $(PREFIX)/sbin
CC	= cc
CPPFLAGSF=
CPPFLAGS=
CFLAGSF	= -W
CFLAGS	= -Wall -g -O2 -pedantic -fPIC -fstack-protector
LDFLAGS	= -Wl,-pie
RM	= rm -f
LN	= ln -f
MKDIR	= mkdir -m 0755 -p
INSTALL	= install


all: $(TARGETS)

inetd_OBJS = $(OBJDIR)config.o $(OBJDIR)parser.o $(OBJDIR)scanner.o $(OBJDIR)service.o $(OBJDIR)token.o $(OBJDIR)inetd.o
inetd_CFLAGS = $(CPPFLAGSF) $(CPPFLAGS) $(CFLAGSF) $(CFLAGS)
inetd_LDFLAGS = $(LDFLAGSF) $(LDFLAGS) 

$(OBJDIR)inetd: $(inetd_OBJS)
	$(CC) -o $(OBJDIR)inetd $(inetd_OBJS) $(inetd_LDFLAGS)

discard_OBJS = $(OBJDIR)discard.o
discard_CFLAGS = $(CPPFLAGSF) $(CPPFLAGS) $(CFLAGSF) $(CFLAGS)
discard_LDFLAGS = $(LDFLAGSF) $(LDFLAGS)

$(OBJDIR)discard: $(discard_OBJS)
	$(CC) -o $(OBJDIR)discard $(discard_OBJS) $(discard_LDFLAGS)

echo_OBJS = $(OBJDIR)echo.o
echo_CFLAGS = $(CPPFLAGSF) $(CPPFLAGS) $(CFLAGSF) $(CFLAGS)
echo_LDFLAGS = $(LDFLAGSF) $(LDFLAGS)

$(OBJDIR)echo: $(echo_OBJS)
	$(CC) -o $(OBJDIR)echo $(echo_OBJS) $(echo_LDFLAGS)

$(OBJDIR)config.o: config.c
	$(CC) $(inetd_CFLAGS) -o $(OBJDIR)config.o -c config.c

$(OBJDIR)parser.o: parser.c
	$(CC) $(inetd_CFLAGS) -o $(OBJDIR)parser.o -c parser.c

$(OBJDIR)scanner.o: scanner.c
	$(CC) $(inetd_CFLAGS) -o $(OBJDIR)scanner.o -c scanner.c

$(OBJDIR)service.o: service.c
	$(CC) $(inetd_CFLAGS) -o $(OBJDIR)service.o -c service.c

$(OBJDIR)token.o: token.c
	$(CC) $(inetd_CFLAGS) -o $(OBJDIR)token.o -c token.c

$(OBJDIR)inetd.o: inetd.c
	$(CC) $(inetd_CFLAGS) -o $(OBJDIR)inetd.o -c inetd.c

$(OBJDIR)discard.o: discard.c
	$(CC) $(discard_CFLAGS) -o $(OBJDIR)discard.o -c discard.c

$(OBJDIR)echo.o: echo.c
	$(CC) $(echo_CFLAGS) -o $(OBJDIR)echo.o -c echo.c

clean:
	$(RM) -- $(inetd_OBJS) $(discard_OBJS) $(echo_OBJS)

distclean: clean
	$(RM) -- $(TARGETS)

install: $(TARGETS)
	$(MKDIR) $(DESTDIR)$(SBINDIR)
	$(INSTALL) -m 0755 $(OBJDIR)inetd $(DESTDIR)$(SBINDIR)/inetd

uninstall:
	$(RM) -- $(DESTDIR)$(SBINDIR)/inetd

.PHONY: all clean distclean install uninstall
