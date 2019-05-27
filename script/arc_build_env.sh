#!/usr/bin/env bash
# Script to setup an android build environment on Arch Linux and derivative distributions

clear
echo Installing Dependencies!
# Update
 sudo pacman -Syyu
# Install pacaur
 sudo pacman -S base-devel git wget multilib-devel cmake svn clang
 sudo pacman -S wget multilib-devel cmake svn clang
# Install ncurses5-compat-libs, lib32-ncurses5-compat-libs, aosp-devel, xml2, and lineageos-devel
for package in ncurses5-compat-libs lib32-ncurses5-compat-libs xml2; do # aosp-devel lineageos-devel; do
    git clone https://aur.archlinux.org/"${package}"
    cd "${package}" || continue
    makepkg -si --skippgpcheck
    cd - || break
    rm -rf "${package}"
done

echo "All Done :'D"
echo "Don't forget to run these commands before building, or make sure the python in your PATH is python2 and not python3"
echo "
virtualenv2 venv
source venv/bin/activate"
echo " or u can change path python with new sysmlink u can check on this for detail"
echo " https://wiki.archlinux.org/index.php/Python#Installation"
