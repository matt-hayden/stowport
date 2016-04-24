# stowport
Simple automated builds, like BSD ports. The root Makefile.user automates fetching the source. Each package has a Makefile.user
automating the config and install steps. These are convenience functions, and definitely not bulletproof. Thus, there is no
warranty.

INSTALLATION:
In your working directory, clone this repository. For example, to pull in gimp sources:
	make -f stowfile/Makefile babl
This will populate ./babl with git and insert a Makefile.user. Follow the specific Makefile.user for each package.
