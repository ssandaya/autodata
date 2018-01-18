#!/bin/bash -vx
source ./config/$1
date
echo "${version_upgrade_factory_tar_file}"
echo "factory download from url"
if [ ! -d /home/jenkins/thumbdrive ] 
then
  mkdir /home/jenkins/thumbdrive/
else
  chmod ugo+wr -R /home/jenkins/thumbdrive/
fi
cd /home/jenkins/thumbdrive/
rm -rf *
wget ${version_upgrade_factory_build_url}
if [ ! -f ${version_upgrade_factory_tar_file} ]
then
  echo "download of factory file failed!"
  exit 1
fi
unzip ${version_upgrade_factory_tar_file}
tar xvzf fedora.tar.gz 
if [ ! -d fedora ]
then
  echo "unzipped fedora not successfull!"
  exit 11
fi
cd fedora
tar xvzf create-upgrade-thumb.tgz
if [ ! -d create-upgrade-thumb ]
then
  echo "extraction to create-upgrade-thumb failed!"
  exit 1
else 
  cd create-upgrade-thumb/
  exit 0
fi
