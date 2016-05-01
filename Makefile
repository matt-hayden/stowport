
LN = cp -Rul

broadcom-4321:
	$(LN) stowport/$@ .
	
babl:
	git clone git://git.gnome.org/$@
	$(LN) stowport/$@ .

gegl:
	git clone git://git.gnome.org/$@
	$(LN) stowport/$@ .

libmypaint:
	git clone git://git.gnome.org/$@.git
	$(LN) stowport/$@ .

gimp:
	git clone git://git.gnome.org/$@
	$(LN) stowport/$@ .

vim:
	git clone git@github:github.com/vim/$@.git
	$(LN) stowport/$@ .

dlib:
	git clone git@github.com:davisking/$@.git
	$(LN) stowport/$@ .

rxvt-unicode:
	cvs -z3 -d :pserver:anonymous@cvs.schmorp.de/schmorpforge co $@
	$(LN) stowport/$@ .
