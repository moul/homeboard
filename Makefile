dev:
	DASHING_AUTH_TOKEN=$(DASHING_AUTH_TOKEN) BASIC_AUTH_PSSWORD=$(BASIC_AUTH_PASSWORD) dashing start

dokku:
	git push dokku master
