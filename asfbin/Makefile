STOWDEST ?= /usr/local/stow/AsfBin

debian64-dep:
	sudo apt-get install -y lib32ncurses5 lib32z1 lib32stdc++6


install: bin
	mkdir -p $(STOWDEST)/bin
	install -m 0775 bin/asfbin $(STOWDEST)/bin
	mkdir -p $(STOWDEST)/share/AsfBin/doc
	install -m 0775 bin/*.txt $(STOWDEST)/share/AsfBin/doc
	cd $(STOWDEST)/.. && sudo stow AsfBin


bin: asfbinlinux1.8.1.892.zip
	unzip -d $@ $^

asfbinlinux1.8.1.892.zip:
	# from http://www.radioactivepages.com/asfbin.aspx
	curl --header 'Host: www.radioactivepages.com' --header 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' --header 'DNT: 1' --header 'Referer: http://www.radioactivepages.com/asfbin.aspx' --header 'Cookie: ASP.NET_SessionId=fvitcxfggqywfiydcsgmc11s; UserSettings=Lang=en-gb' --header 'Connection: keep-alive' 'http://www.radioactivepages.com/downloading.ashx?file=asfbin/asfbinlinux1.8.1.892.zip' -o 'asfbinlinux1.8.1.892.zip' -L
