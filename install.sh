#!/bin/sh
##########################################################################
# Copyright 2016 Vuid Pty Ltd 
# https://www.vuid.com
#
# This file is part of tredly-build.
#
# tredly-build is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# tredly-build is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with tredly-build.  If not, see <http://www.gnu.org/licenses/>.
##########################################################################

# make sure this user is root
euid=$( id -u )
if test $euid != 0
then
   echo "Please run this installer as root." 1>&2
   exit 1
fi
# install bash before invoking the bash installer
pkg install -y bash

./helpers/bash_install.sh

if test $? == 0
then
    echo "################"
    echo "Install complete. Please perform the following manual commands:"
    echo "1. Copy your SSL certificates into /usr/local/etc/nginx/ssl/ and configure them in /usr/local/etc/nginx/sslconfig/."
    echo "2. Reboot your host for the new kernel and settings to take effect."
fi