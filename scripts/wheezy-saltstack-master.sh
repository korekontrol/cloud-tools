#!/bin/bash

set -e
echo "###"
echo "### Instaling SaltStack master on this host"
echo "###"

# Allow access via ssh to root account
key="ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAu6B/194wiz1Phd1tGGnlPJaFwHUm+Fyc2Ku8mMuPIodwqLjTa+ZZ3lhOmxHgO2VTeC/46p7HprlatSWBiS3rm28HW3tM0wLyxazUNN5xmUjRuYRun7IGlo9Q9BvBMdgNTZ464DWPbidRqHFoYG6Qh8+Tt2orEc/YcwKLzkjcvRYWuFRsf0yQr25Ouoweq+hXEetYPn67yWNndqfzBOvPDAYKcLy2rvnLNlE0GSlD52dLJ3uPFLa7IGlg9uI0wW9shyeLy04P+197rqRoMkeMHRrvgBIud3Z8Xz0nOxEivD+nFXnpaV4wHxEPaViWhuFXvRrsSltDU7+jGyrJbV5GpQ== elephant@punx.pl"
mkdir -p /root/.ssh
if [ ! -f /root/.ssh/authorized_keys ]; then
  echo "$key" > /root/.ssh/authorized_keys
fi

# Prepare apt repositories, install packages
echo "deb http://debian.saltstack.com/debian wheezy-saltstack main" > /etc/apt/sources.list.d/saltstack.list
wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add -
apt-get -qq update
apt-get -qq install salt-master python-pip

# Create code directory
mkdir -p /srv/salt

# Open salt-master firewall ports
ufw allow 4505/tcp
ufw allow 4506/tcp

# Install python extensions for rackspace cloud
pip -q install rackspace-novaclient salt-cloud apache_libcloud

# Prepare for cloud credentials
mkdir /etc/salt/cloud.providers.d
[ -f /etc/salt/cloud.providers.d/rackspace.conf ] || cat > /etc/salt/cloud.providers.d/rackspace.conf << EOF
marconi-test:
  minion:
    master: <IP address of salt master>

  identity_url: 'https://lon.identity.api.rackspacecloud.com/v2.0/tokens'
  compute_name: cloudServersOpenStack
  protocol: ipv4

  compute_region: LON

  user: <username>
  apikey: <API key>

provider: openstack
EOF

