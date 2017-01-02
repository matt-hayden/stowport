# stowport
This is an organizer for automated builds, like BSD ports. Each package gets a directory and a root Makefile.

If you installed without forking, you likely want to start with your own branch:

    git checkout -b builds-for-$HOSTNAME

To build a package:

    make MKVToolNix

The MKVToolNix directory will take care of installation. On Debian-based systems, libraries are automatically installed. Please feel free to extend this to ``.rpm`` based systems as well. ``sudo`` authorization is required for system installation (the default).

Non-system installation is achieved by specifying ``STOWROOT`` in the make command. Note that linking can become troublesome is libraries are not obvious to ldd.

## License
These are convenience functions, and definitely not bulletproof. Thus, there is no warranty.

And each package will have its own warranty. Cheers to the writer and maintainers making this possible.
