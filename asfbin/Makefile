STOWDEST ?= /usr/local/stow/AsfBin


#install: bin
#	cp -Rbl bin $(STOWDEST)
#	cd $(STOWDEST)/.. && sudo stow AsfBin


bin32: asfbinlinux1.8.1.892.zip
	[ -d $@ ] || mkdir $@
	cd $@ && unzip ../$^

asfbinlinux1.8.1.892.zip:
	# from http://www.radioactivepages.com/asfbin.aspx
	curl --header 'Host: www.radioactivepages.com' --header 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' --header 'DNT: 1' --header 'Referer: http://www.radioactivepages.com/asfbin.aspx' --header 'Cookie: ASP.NET_SessionId=fvitcxfggqywfiydcsgmc11s; UserSettings=Lang=en-gb' --header 'Connection: keep-alive' 'http://www.radioactivepages.com/downloading.ashx?file=asfbin/asfbinlinux1.8.1.892.zip' -o 'asfbinlinux1.8.1.892.zip' -L
