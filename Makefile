

broadcom-4321:
	cp -Rul stowport/$@ .
	
babl:
	git clone git://git.gnome.org/$@
	cp -Rul stowport/$@ .

gegl:
	git clone git://git.gnome.org/$@
	cp -Rul stowport/$@ .

libmypaint:
	git clone git://git.gnome.org/$@.git
	cp -Rul stowport/$@ .

gimp:
	git clone git://git.gnome.org/$@
	cp -Rul stowport/$@ .

vim:
	hg clone https://bitbucket.org/vim-mirror/vim
	cp -Rul stowport/$@ .
