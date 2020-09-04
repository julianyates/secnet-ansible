#!/bin/sh

CREATE="/opt/repos/centos/8 /opt/repos/centos/8/AppStream/x86_64 /opt/repos/centos/8/BaseOS/x86_64 /opt/repos/centos/8/centosplus/x86_64 /opt/repos/centos/8/cloud/x86_64 /opt/repos/centos/8/configmanagement/x86_64 /opt/repos/centos/8/Devel/x86_64 /opt/repos/centos/8/extras/x86_64 /opt/repos/centos/8/HighAvailability/x86_64 /opt/repos/centos/8/messaging/x86_64 /opt/repos/centos/8/opstools/x86_64 /opt/repos/centos/8/PowerTools/x86_64 /opt/repos/centos/8/storage/x86_64 /opt/repos/centos/8/virt/x86_64 /opt/repos/epel /opt/repos/epel/8/Everything/x86_64"

for x in $CREATE; do
	if [ ! -d $x ]; then
		echo "Creating $x Directory"
		mkdir -p $x
	fi
done

echo "Downloading RPM GPG Key"
wget -P /opt/repos/centos/8/RPM-GPG-KEY-CentOS-Official https://www.centos.org/keys/RPM-GPG-KEY-CentOS-Official

echo "Syncing DNF Repository"
rsync  -avSHP --delete rsync://mirror.vcu.edu/centos/8/AppStream/x86_64/ /opt/repos/centos/8/AppStream/x86_64/
rsync  -avSHP --delete rsync://mirror.vcu.edu/centos/8/BaseOS/x86_64/ /opt/repos/centos/8/BaseOS/x86_64/
rsync  -avSHP --delete rsync://mirror.vcu.edu/centos/8/centosplus/x86_64/ /opt/repos/centos/8/centosplus/x86_64/
rsync  -avSHP --delete rsync://mirror.vcu.edu/centos/8/cloud/x86_64/ /opt/repos/centos/8/cloud/x86_64/
rsync  -avSHP --delete rsync://mirror.vcu.edu/centos/8/configmanagement/x86_64/ /opt/repos/centos/8/configmanagement/x86_64/
rsync  -avSHP --delete rsync://mirror.vcu.edu/centos/8/Devel/x86_64/ /opt/repos/centos/8/Devel/x86_64/
rsync  -avSHP --delete rsync://mirror.vcu.edu/centos/8/extras/x86_64/ /opt/repos/centos/8/extras/x86_64/
rsync  -avSHP --delete rsync://mirror.vcu.edu/centos/8/HighAvailability/x86_64/ /opt/repos/centos/8/HighAvailability/x86_64/
rsync  -avSHP --delete rsync://mirror.vcu.edu/centos/8/messaging/x86_64/ /opt/repos/centos/8/messaging/x86_64/
rsync  -avSHP --delete rsync://mirror.vcu.edu/centos/8/opstools/x86_64/ /opt/repos/centos/8/opstools/x86_64/
rsync  -avSHP --delete rsync://mirror.vcu.edu/centos/8/PowerTools/x86_64/ /opt/repos/centos/8/PowerTools/x86_64/
rsync  -avSHP --delete rsync://mirror.vcu.edu/centos/8/storage/x86_64/ /opt/repos/centos/8/storage/x86_64/
rsync  -avSHP --delete rsync://mirror.vcu.edu/centos/8/virt/x86_64/ /opt/repos/centos/8/virt/x86_64/

echo "Syncing EPEL Repository"
rsync  -avSHP --delete rsync://mirror.steadfastnet.com/epel/RPM-GPG-KEY-EPEL-8 /opt/repos/epel/RPM-GPG-KEY-EPEL-8
rsync  -avSHP --delete rsync://mirror.steadfastnet.com/epel/8/Everything/x86_64/ /opt/repos/epel/8/Everything/x86_64

echo "Syncing NGINX Repository"
wget --no-parent -m http://nginx.org/packages/mainline/centos/8/x86_64/ -P /opt/repos
curl https://nginx.org/keys/nginx_signing.key > /opt/repos/nginx.org/nginx_signing.key

exit 0
