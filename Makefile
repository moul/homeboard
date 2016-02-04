dev:
	. .env; dashing start

dokku:
	git push dokku master
