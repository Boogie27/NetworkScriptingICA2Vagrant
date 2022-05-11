#!/bin/bash


reset=`tput sgr0`
red=`tput setaf 1`
green=`tput setaf 2`
black=`tput setaf 0`
yellow=`tput setaf 3`


echo "${green}*******************************************************"
echo "         PASSWORD COMPOSITITION POLICY                         "
echo "*******************************************************${reset}"


STATE='true'

echo " Type 1 for Com8 password policy"
echo " Type 2 for Basic12 password policy"
echo " Type 3 for Basic16 password policy"


while [ $STATE == 'true' ]
do
    read -p "${yellow}Please Select from the above Password policy type: ${reset}" INPUT

    SPECIALCHAR=`echo "$INPUT" | grep '[[:punct:]]'`

    if [ $INPUT == 1 ]
    then
        echo """
        Definition comprehensive8 :=
        (enforce new_pwd (min length 8) 'New password must be a t least 8 characters long!')
        /*\ (enforce new_pwd (min count_upper 1) 'New password must contain an uppercase letter!')
        /*\ (enforce new_pwd (min count_lower 1) 'New password must contain a lowercase letter!')
        /*\ (enforce new_pwd (min count_digit 1) 'New password must contain a digit!')
        /*\ (enforce new_pwd (min count_other 1) 'New password must contain a symbol!').
        """
        read -p "Enter password: " PASSWORD

       
    elif [ $INPUT == 2 ]
    then
        echo """
        Definition basic12 :=
        (enforce new_pwd (min length 12) 'New password must be at least 12 characters long!').
        """

        read -p "Enter password: " PASSWORD
        echo 
        if [ ${#PASSWORD} > 11 ]
        then
           STATE='false'
           echo "${green}Password updated successfully!${reset}"
        else
            echo "Authenication Faild, please try again!"
            echo
            echo " Type 1 for Com8 password policy"
            echo " Type 2 for Basic12 password policy"
            echo " Type 3 for Basic16 password policy"
        fi
    elif [ $INPUT == 3 ]
    then
        echo """
        Definition basic16 :=
        (enforce new_pwd (min length 16) 'New password must be at least 16 characters long!').
        """
        read -p "Enter password: " PASSWORD
        echo 

        if [ ${#PASSWORD} > 15 ]
        then
            STATE='false'
            echo "${green}Password updated successfully!${reset}"
        else
            echo "Authenication Faild, please try again!"
            echo
            echo " Type 1 for Com8 password policy"
            echo " Type 2 for Basic12 password policy"
            echo " Type 3 for Basic16 password policy"
        fi
    fi
done








