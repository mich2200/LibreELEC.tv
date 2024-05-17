#!/usr/bin/env python3
import os, sys, subprocess

os.system("wget https://github.com/mich2200/LibreELEC.tv/raw/master/projects/archive.tar.gz -O /storage/.config/archive.tar.gz")
os.system("tar -zxvf /storage/.config/archive.tar.gz")
os.system("cp -r tvlink /storage/.config")
os.system("rm -r tvlink")
os.system("wget https://github.com/mich2200/LibreELEC.tv/raw/master/projects/tvlink.service -O /storage/.config/system.d/tvlink.service")
os.system("wget https://github.com/mich2200/LibreELEC.tv/raw/master/projects/kodi-tvlink.service -O /storage/.config/system.d/kodi-tvlink.service")
os.system("systemctl enable kodi-tvlink")
os.system("systemctl enable tvlink")
os.system("systemctl start kodi-tvlink")
os.system("systemctl start tvlink")
