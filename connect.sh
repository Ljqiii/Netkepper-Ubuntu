NAME=`./getusername.out`
PASSWD="123456"

echo "正在修改配置文件 /etc/ppp/peers/dsl-provider \n"

cat > /etc/ppp/peers/dsl-provider<<-EOF
# Minimalistic default options file for DSL/PPPoE connections

noipdefault
defaultroute
replacedefaultroute
hide-password
#lcp-echo-interval 30
#lcp-echo-failure 4
noauth
persist
#mtu 1492
#persist
#maxfail 0
#holdoff 20
plugin rp-pppoe.so
nic-enp3s0
usepeerdns
user "${NAME}"
EOF

echo "正在修改配置文件 /etc/ppp/pap-secrets \n"
cat > /etc/ppp/pap-secrets<<-EOF
#
# /etc/ppp/pap-secrets
#
# This is a pap-secrets file to be used with the AUTO_PPP function of
# mgetty. mgetty-0.99 is preconfigured to startup pppd with the login option
# which will cause pppd to consult /etc/passwd (and /etc/shadow in turn)
# after a user has passed this file. Don't be disturbed therefore by the fact
# that this file defines logins with any password for users. /etc/passwd
# (again, /etc/shadow, too) will catch passwd mismatches.
#
# This file should block ALL users that should not be able to do AUTO_PPP.
# AUTO_PPP bypasses the usual login program so it's necessary to list all
# system userids with regular passwords here.
#
# ATTENTION: The definitions here can allow users to login without a
# password if you don't use the login option of pppd! The mgetty Debian
# package already provides this option; make sure you don't change that.

# INBOUND connections

# Every regular user can use PPP and has to use passwords from /etc/passwd
*	hostname	""	*

# UserIDs that cannot use PPP at all. Check your /etc/passwd and add any
# other accounts that should not be able to use pppd!
guest	hostname	"*"	-
master	hostname	"*"	-
root	hostname	"*"	-
support	hostname	"*"	-
stats	hostname	"*"	-

# OUTBOUND connections

# Here you should add your userid password to connect to your providers via
# PAP. The * means that the password is to be used for ANY host you connect
# to. Thus you do not have to worry about the foreign machine name. Just
# replace password with your password.
# If you have different providers with different passwords then you better
# remove the following line.

#	*	password



"username" * ""


"${NAME}" * "${PASSWD}"
EOF


echo "正在修改配置文件 /etc/ppp/chap-secrets \n"
cat > /etc/ppp/chap-secrets<<-EOF

# Secrets for authentication using CHAP
# client	server	secret			IP addresses



"username" * ""


"${NAME}" * "${PASSWD}"
EOF
#进行 pppoe 拨号
pon dsl-provider
