#
# Network Message Stimulator
#
CSC = csc
MONO = mono
PRINTF = printf
RM = rm -f
CP = cp
CD = cd
ZIP = zip
CHMOD = chmod
MKDIR = mkdir -p
FLAGS = -nologo -platform:x64 -optimize
AOTFLAGS = --aot=full
SRCS = main.cs stimulator.cs options.cs socket.cs
TARGETDIR = ../target
TARGET = msg_stim.exe
AOTLIB = $(TARGET).so
PACKAGEDIR = ../package
PACKAGE = msg_stim.zip

.PHONY: all install package clean

all: $(TARGET)

$(TARGET): $(SRCS) Makefile
	@$(PRINTF) "\tBuilding $(TARGET)\n"
	@if [ X$(VERBOSE) != X ]; then \
		$(PRINTF) "\t$(CSC) $(FLAGS) -out:$(TARGET) $(SRCS)\n"; \
		$(PRINTF) "\t$(MONO) $(AOTFLAGS) $(TARGET)\n"; \
	fi
	@$(CSC) $(FLAGS) -out:$(TARGET) $(SRCS)
	#@$(MONO) $(AOTFLAGS) $(TARGET) 

install: all
	@$(PRINTF) "\tInstalling target\n"
	@$(RM) $(TARGETDIR)/$(TARGET) $(TARGETDIR)/$(AOTLIB)
	@$(CP) $(TARGET) $(TARGETDIR)/.
	@$(PRINTF) %s%s '4e: 48 65 79 2c 20 77 68 61 74 20 61 72 65 20 79 6f 75 20 64 6f ' \
		        '69 6e 67 3f 0d 0d 0a 20 08 20 08 20 08 20 08 20 08 20 08 20 08 20' | \
		xxd -c 42 -r - $(TARGETDIR)/$(TARGET)
	@$(CP) $(AOTLIB) $(TARGETDIR)/.
	@$(CHMOD) 444 $(TARGETDIR)/$(TARGET) $(TARGETDIR)/$(AOTLIB)

package: install
	@$(PRINTF) "\tMaking distribution\n"
	@$(CD) $(TARGETDIR); \
	$(MKDIR) data; \
        $(CP) ../data/cooked/* data/.; \
	$(ZIP) -r $(PACKAGEDIR)/$(PACKAGE) *; \
	$(CHMOD) 444 $(PACKAGEDIR)/$(PACKAGE)

clean:
	@if [ X$(VERBOSE) != X ]; then \
		$(PRINTF) "\t$(RM) $(TARGETDIR)/$(TARGET) $(PACKAGEDIR)/$(PACKAGE) $(TARGET)\n"; \
	fi
	@$(RM) $(TARGETDIR)/$(TARGET) $(TARGETDIR)/$(AOTLIB) $(PACKAGEDIR)/$(PACKAGE) $(TARGET) $(AOTLIB); \
	$(RM) -R $(TARGETDIR)/data

