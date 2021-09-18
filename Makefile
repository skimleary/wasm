
.PHONY: all install package clean

all:
	@$(MAKE) -C src all

install:
	@$(MAKE) -C src install

package:
	@$(MAKE) -C src package

clean:
	@$(MAKE) -C src clean

