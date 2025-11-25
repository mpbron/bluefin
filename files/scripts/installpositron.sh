#! /bin/bash
TAG_NAME=$(curl -s https://api.github.com/repos/posit-dev/positron/releases | jq '.[0]' | jq '.tag_name' | tr -d '"')
wget -O positron.rpm https://cdn.posit.co/positron/dailies/rpm/x86_64/Positron-$TAG_NAME-x64.rpm
dnf5 install positron.rpm
rm positron.rpm