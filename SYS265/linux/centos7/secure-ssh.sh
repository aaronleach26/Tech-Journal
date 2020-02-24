#secure-ssh.sh
#author aaronleach26
#creates a new ssh user using $l parameter
#adds a public key from the local repo or curled from the remote repo
#removes root ability to shh in

useradd -m -d /home/$1 -s /bin/bash $1
sudo mkdir /home/$1/.ssh
sudo cp /home/aaron/Tech-Journal/SYS265/linux/public-keys/id_rsa.pub /home/$1/.ssh/authorized_keys
sudo chmod 700 /home/$1/.ssh
sudo chmod 600 /home/$1/.ssh/authorized_keys
sudo chown -R $1:$1 /home/$1/.ssh
