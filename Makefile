reschange.deb:
	dpkg-deb -b ./pkg reschange.deb

install:
	dpkg -i ./reschange.deb