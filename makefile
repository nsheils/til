server:
	cd hugosite && hugo server --renderToMemory

# Run the server and bind to the IP address of the en0 interface so that the
# site can be accessed from other devices on the network.
export IPADDR := $(shell ifeq ($(OS),Windows_NT),$(shell ipconfig getifaddr en0),$(shell hostname -I | awk '{print $$1}'))
network_server:
	cd hugosite && hugo server --renderToMemory --bind $(IPADDR) --baseURL http://$(IPADDR)

build:
	rm -rf docs
	cd hugosite && hugo

lint: markdownlint prettier_lint vale

markdownlint:
	markdownlint .

prettier_lint:
	prettier --check .

vale:
	vale .

fix: markdownlint_fix prettier_fix

markdownlint_fix:
	markdownlint --fix posts/ *.md

prettier_fix:
	prettier --write posts/
	prettier --write *.md
