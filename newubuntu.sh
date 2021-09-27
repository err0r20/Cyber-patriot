#!/bin/bash

#Code made by Exspiravit

#Cyberpatriot Script

aptfun(){
apt-get -V -y install --reinstall coreutils
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get install -r -y
apt-get autoremove -y
apt-get autoclean -y
apt-get check
cont
}

deletefiles(){
echo "Deleting Files, Please Wait"

#3ga *.aac *.aiff *.amr *.ape *.arf *.asf *.asx *.cda *.dvf *.flac *.gp4 *.gp5 *.gpx *.logic *.m4a *.m4b*.midi *.pcm *.rec *.snd *.sng *.uax *.wav *.wma *.wpl *.zab
#->Video
#-->*.mkv *.webm *.flv *.vob *.ogv *.drc *.gifv *.mng *.avi$ *.mov *.qt *.wmv *.yuv *.rm *.rmvb *.asf *.amv *.mp4$ *.m4v *.mp *.m?v *.svi *.3gp *.flv *.f4v

sudo find / -name '*.mkv' -type f -delete
sudo find / -name '*.webm' -type f -delete
sudo find / -name '*.flv' -type f -delete
sudo find / -name '*.vob' -type f -delete
sudo find / -name '*.ogv' -type f -delete
sudo find / -name '*.drc' -type f -delete
sudo find / -name '*.gifv' -type f -delete
sudo find / -name '*.mng' -type f -delete
sudo find / -name '*.avi$' -type f -delete
sudo find / -name '*.wmv' -type f -delete
sudo find / -name '*.mov' -type f -delete
sudo find / -name '*.qt' -type f -delete
sudo find / -name '*.mov' -type f -delete
sudo find / -name '*.yuv' -type f -delete
sudo find / -name '*.rm' -type f -delete
sudo find / -name '*.rmvb' -type f -delete
sudo find / -name '*.asf' -type f -delete
sudo find / -name '*.mp4$' -type f -delete
sudo find / -name '*.amv' -type f -delete
sudo find / -name '*.m4v' -type f -delete
sudo find / -name '*.mp' -type f -delete
sudo find / -name '*.m?v' -type f -delete
sudo find / -name '*.svi' -type f -delete
sudo find / -name '*.3gp' -type f -delete
sudo find / -name '*.flv' -type f -delete
sudo find / -name '*.f4v' -type f -delete


sudo find / -name '*.mp3' -type f -delete
sudo find / -name '*.3ga' -type f -delete
sudo find / -name '*.mp4' -type f -delete
sudo find / -name '*.avi' -type f -delete
sudo find / -name '*.mpg' -type f -delete
sudo find / -name '*.mpeg' -type f -delete
sudo find / -name '*.flac' -type f -delete
sudo find / -name '*.m4a' -type f -delete
sudo find / -name '*.flv' -type f -delete
sudo find / -name '*.aac' -type f -delete
sudo find / -name '*.aiff' -type f -delete
sudo find / -name '*.amr' -type f -delete
sudo find / -name '*.ape' -type f -delete
sudo find / -name '*.ogg' -type f -delete
sudo find / -name '*.arf' -type f -delete
sudo find / -name '*.asf' -type f -delete
sudo find / -name '*.asx' -type f -delete
sudo find / -name '*.cda' -type f -delete
sudo find / -name '*.dvf' -type f -delete
sudo find / -name '*.flac' -type f -delete
sudo find / -name '*.gp4' -type f -delete
sudo find / -name '*.gp5' -type f -delete
sudo find / -name '*.gpx' -type f -delete
sudo find / -name '*.logic' -type f -delete
sudo find / -name '*.m4a' -type f -delete
sudo find / -name '*.m4p' -type f -delete
sudo find / -name '*.m4b' -type f -delete
sudo find / -name '*.midi' -type f -delete
sudo find / -name '*.pcm' -type f -delete
sudo find / -name '*.rec' -type f -delete
sudo find / -name '*.snd' -type f -delete
sudo find / -name '*.sng' -type f -delete
sudo find / -name '*.uax' -type f -delete
sudo find / -name '*.wav' -type f -delete
sudo find / -name '*.wma' -type f -delete
sudo find / -name '*.wpl' -type f -delete
sudo find / -name '*.zav' -type f -delete
echo "Files Deleted"
}

processes(){
lsof -i -n -P && sudo netstat -tulpn >> net_processes.txt
}

firewall(){
systemctl start ufw
ufw allow 22
ufw deny 23
ufw deny 2049
ufw deny 515
ufw deny 111
echo "Firewall enabled"
}

passauthstrength(){
echo "Making password authentication a thing here, gimme a sec"
sudo sed -i '1 S/^/auth optional pam_tally.so deny=5 unlock_time=900 onerr=fail audit even_deny_root_account silent\n/' /etc/pam.d/common-auth 
sudo sed -i '1 s/^/password requisite pam_cracklib.so retry=3 minlen=8 difolk=3 reject_username minclass=3 maxrepeat=2 dcredit=1 ucr edit=1 lcredit=1 ocredit=1\n/' /etc/pam.d/common-password
echo "Done"
}

passwordage(){
echo "Configuring password aging controls, please wait while I make your life easier.."
sudo sed -i '/^PASS_MAX_DAYS/ c\PASS_MAX_DAYS   90' /etc/login.defs
sudo sed -i '/^PASS_MIN_DAYS/ c\PASS_MIN_DAYS   10'  /etc/login.defs
sudo sed -i '/^PASS_WARN_AGE/ c\PASS_WARN_AGE   7' /etc/login.defs
echo "Process done!"
}

disablingguest(){
echo "allow-guest=false" >> /etc/lightdm/lightdm.conf
echo "Done"
}

rootcron(){
crontab -r
cd /etc/
/bin/rm -f cron.deny at.deny
echo root >cron.allow
echo root >at.allow
/bin/chown root:root cron.allow at.allow
/bin/chmod 644 cron.allow at.allow
echo "Done"
}

pupcleaning(){
echo "Checking for some PUP"
sudo apt-get -y purge hydra
sudo apt-get -y purge john
sudo apt-get -y purge nikto
sudo apt-get -y purge netcat
sudo apt-get -y purge mysql
echo "Success"
}

apachesecfun(){
echo "Securing Apache"
chown -R root:root /etc/apache2
chown -R root:root /etc/apache
if [ -e /etc/apache2/apache2.conf ]; then
echo "<Directory />" >> /etc/apache2/apache2.conf
echo "AllowOverride None" >> /etc/apache2/apache2.conf
echo "Order Deny,Allow" >> /etc/apache2/apache2.conf
echo "Deny from all" >> /etc/apache2/apache2.conf
echo "</Directory>" >> /etc/apache2/apache2.conf
echo "UserDir disabled root" >> /etc/apache2/apache2.conf
fi
systemctl restart apache.service
echo "Done"
}

filesecfun(){
cut -d: f1, 3 /etc/passwd | egrep ':[0-9]{4}$' | cut -d: -f1 > /tmp/listofusers
echo root >> /tmp/listofusers
echo "Get Ready For Manual Inspection"
nano /etc/apt/sources.list #Check for anything malicious
nano /etc/resolv.conf #Make sure it's safe, use 8.8.8.8 for name server
nano /etc/hosts #Make sure it is not redirecting
visudo #Make sure the sudoers file is clean. Should be no "NOPASSWD"
nano /tmp/listofusers #No unauthorized users
nano /etc/rc.local #Empty except for 'exit 0'
nano /etc/sysctl.conf #Change net.ipv4.tcp_syncookies entry from 0 to 1
nano /etc/lightdm/lightdm.conf #allow_guest=false, remove autologin
nano /etc/ssh/sshd_config #Look for PermitRootLogin and set it to no
}

RootPasswordProtected(){
sudo usermod -p '!' root
}

start(){
aptfun
deletefiles
processes
firewall
passauthstrength
passwordage
disablingguest
rootcron
pupcleaning
apachesecfun
filesecfun
RootPasswordProtected
}

echo "Run my awesome script? y/n?"
read Start
if [ $Start == 'y' ]; then
start
elfi [ $Start == 'n' ] exit;
cd $(pwd)
fi
