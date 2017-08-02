#!/usr/bin/env bash

#
# download_files.sh
#
# Copyright (C) 2017 James Joseph Balamuta <balamut2@illinois.edu>
#
# Version 1.0 -- 06/18/17
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#

#### Download and Extract Pre-built Binary

# Helper functions

#1 Base URL (with trailing /)
#2 File name
download_file(){
	if [ -f "$2" ]; then
		echo "$2 has already been downloaded..."
	else 
	    echo "Downloading file $2 ... Please be patient..."	
		# Download file into working directory
		curl -O $1$2
	fi
}

#1 File name
extract_file(){
	# Extract in working directory
	tar fvxz $1 -C ROOT/
}

# At the present time of writing there is a disclaimer on the macOS tools
# (https://cran.r-project.org/bin/macosx/tools/)
# page indicating binaries are available in the `libs` directory here:
# http://r.research.att.com/libs/

# The script will seek to download and extract the clang4 build.
LIBS_URL="http://r.research.att.com/libs/"
REQUESTED_FILE="clang-4.0.0-darwin15.6-Release.tar.gz"

# Done in working directory
download_file $LIBS_URL $REQUESTED_FILE
mkdir -p ROOT/
extract_file $REQUESTED_FILE
