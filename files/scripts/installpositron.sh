#! /bin/bash
POSITRON_RPM=$(curl -s https://api.github.com/repos/posit-dev/positron/releases | jq '.[0]' | jq '.assets[] | select(.name|match("x64.rpm$")) | .browser_download_url' | tr -d '"')
wget -O positron.rpm $POSITRON_RPM
rpm-ostree install positron.rpm
rm positron.rpm