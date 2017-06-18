# Installer Package for `clang4` R Binaries

The following repository contains the scripts used to create the installer package (.pkg)
for the `clang4` binaries available on <http://r.research.att.com/libs/>. The scripts 
have the potential to be generalized further so that `.pkg` installers are available 
to be created for all binaries listed on <http://r.research.att.com/libs/>.

## Overview of Files

Below is an abridged version of the actions of each file provided.

- `download_files.sh`
   - Downloads the `clang-4.0.0-darwin15.6-Release.tar.gz` from
    <http://r.research.att.com/libs/> and extracts it into `ROOT` 
- `scripts/postinstall`
   - Create or modify the `~/.R/Makevars` file with the necessary values to compile with _clang4_.
   - This is run at the _end_ of the installer routine.
- `make_installer.sh`
   - Create the installer package R binary installer `.pkg`
      - Builds the package from the extracted tar using `pkgbuild` 
      - Analyzing the package using `productbuild` to create a `distribution.xml`   
	  - Inserts customizations into the `distribution.xml` (title, background, ...)
	  - Calls `productbuild` to rebuild the package.
- `distribution.xml`
   - Customization options (e.g. title, background) of installer built by analyzing a temporary .pkg
- `images/Rlogo.png`
   - R logo

# License

GPL 2 <= 