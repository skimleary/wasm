
.PHONY: all install package clean

all:
	@$(MAKE) -C src all

install:
	@$(MAKE) -C src install

test:
	#@$(MAKE) -C src test
	NO_COLOR=1 npx cypress run --config video=false

clean:
	@$(MAKE) -C src clean
	# cypress/downloads/*
	# cypress/screenshots/*
	# cypress/videos/*

