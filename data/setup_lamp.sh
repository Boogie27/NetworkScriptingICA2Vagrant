# #!/bin/bash


# colors pallet
reset=`tput sgr0`
red=`tput setaf 1`
green=`tput setaf 2`
black=`tput setaf 0`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 7`





USERS=('mraffone' 'tknight' 'willwaite' 'cbarr' 'bcade')
COMP_GROUPS=('executive-staff' 'management-staff' 'technical-staff' 'temporary-staff')








#  create groups
function create_groups(){
    GROUPS_CREATED=0

    echo "${yellow}Creating Groups...............${reset}"
    echo ""
    sleep 1

    for i in ${COMP_GROUPS[@]}
    do
        if [ $(getent group ${i}) ]
        then
            echo "${i} Group ${red}already exist!${reset}"
        else
            sudo groupadd ${i}
            GROUPS_CREATED=$((GROUPS_CREATED+1))
            echo "${i} Group ${green}created successfull!${reset}"
        fi
    done

    sleep 1
    echo "${green}Groups created:......($GROUPS_CREATED) ${reset}"
    echo ""
}

create_groups







# create users and asign users to groups
function create_users(){

    echo "${yellow}Creating Users..............${reset}"
    echo ""
    sleep 1

    for i in ${COMP_GROUPS[@]}
    do
        if [ $(getent group ${i}) ]
        then
            if [ ${i} == 'executive-staff' ]
            then
                USER_CREATED=$((USER_CREATED+1))
                sudo useradd -m -s /bin/bash -c "This is Mike Raffone" mraffone
                echo "theboss" | sudo passwd --stdin mraffone
                sudo usermod -aG executive-staff mraffone
                echo "${green}mraffone${reset} added to ${i} Group ${green}successfully!${reset}"

                sudo useradd -m -s /bin/bash -c "This is Tamara Knight" tknight
                echo "vapourcountry" | sudo passwd --stdin tknight
                sudo usermod -aG executive-staff tknight
                echo "${green}tknight${reset} added to ${i} Group ${green}successfully!${reset}"
            fi

            if [ ${i} == 'management-staff' ]
            then
                sudo useradd -m -s /bin/bash -c "This is Willie Waite" willwaite
                echo "goatraspberry" | sudo passwd --stdin willwaite
                sudo usermod -aG management-staff willwaite
                echo "${green}willwaite${reset} added to ${i} Group ${green}successfully!${reset}"
            fi
            if [ ${i} == 'technical-staff' ]
            then
                sudo useradd -m -s /bin/bash -c "This is Candy Barr" cbarr
                echo "zombiesimpsons" | sudo passwd --stdin cbarr
                sudo usermod -aG technical-staff cbarr
                echo "${green}CBarr${reset} added to ${i} Group ${green}successfully!${reset}"

                sudo useradd -m -s /bin/bash -c "This is Barry Cade" bcade
                echo "formalmethodsyes" | sudo passwd --stdin bcade
                sudo usermod -aG technical-staff bcade
                echo "${green}bcade${reset} added to ${i} Group ${green}successfully!${reset}"
            fi
        fi
    done
    sleep 1
    echo "${green}Users created:......(4) ${reset}"
    echo ""
}
create_users





# adds users to super group to use sudo
function assign_user_to_group(){
    sudo usermod -aG wheel mraffone 
    sudo usermod -aG wheel tknight 
}

assign_user_to_group







# *****************************************
#  INSTALL AND START LAMP SERVER
# *****************************************
function install_lamp_server(){
    echo "${green}*********************************************************"
    echo "      INSTALLING AND STARTING MARIADB SERVER"
    echo "*********************************************************${reset}"
    sleep 2

    # install mariadb server
    sudo yum install mariadb-server 

    # start mariadb server
    sudo service mariadb start

    # add secure authentication
    sudo mysql_secure_installation

}
install_lamp_server







function install_php(){
    echo "${green}*********************************************************"
    echo "      INSTALLING AND STARTING PHP AND MYSQL"
    echo "*********************************************************${reset}"
    sleep 2

    # install php
    sudo yum install php

    # install php mysqli
    sudo yum install php-mysqli

    # start httpd
    sudo service httpd restart

    # move index.php file to html folder 
    sudo cp ~/index.php /var/www/html
    

    # create and popullate database
    mysql -uroot -p < make_staff_database.sql
}
install_php









# create required folders
function user_folders(){
    USERS=('mraffone' 'tknight' 'willwaite') # executive and managment users

    # create members directory
    sudo mkdir /var/www/html/members

    # create private folder
    sudo mkdir /var/www/html/private
    sudo touch /var/www/html/private/index.php
    echo "This is private's personal space." | sudo tee /var/www/html/private/index.php

    echo "${yellow}*********************************************************"
    echo "                  CREATING MEMBERS FOLDERS"
    echo "*********************************************************${reset}"
    sleep 2

    # create users folders
    for i in ${USERS[@]}
    do
        sudo mkdir /var/www/html/members/${i}
        sudo touch /var/www/html/members/${i}/index.php
        sudo chmod 700 /var/www/html/members/${i}/index.php
        sudo chown ${i} /var/www/html/members/${i}/index.php
        echo "This is ${i}'s personal space." | sudo tee /var/www/html/members/${i}/index.php
    done
    echo "${green} Created tknight, mraffone, willwaite folder ${green}successfully!${reset}"
}
user_folders









# configure private folder using .htaccess file
function set_private(){
    sudo touch /var/www/html/private/.htaccess
    sudo touch /var/www/html/private/.htpassword

    echo "gasmember:$2y$10$cvL31o/OQt8s2DyxlnzHSeFG.JI4zrd9syhNWN6BbqWItB//KeIea" | sudo tee /var/www/html/private/.htpassword

    echo """
    AuthType Basic
    AuthName 'Password protected, Authentication required!' 
    AuthUserFile /var/www/html/private/.htpassword 
    Require valid-user  
    """ | sudo tee /var/www/html/private/.htaccess
}
set_private






# website to generate password
# https://hostingcanada.org/htpasswd-generator/

# generated password
# username: gasmember
# password: gimmedata

# gasmember:$2y$10$cvL31o/OQt8s2DyxlnzHSeFG.JI4zrd9syhNWN6BbqWItB//KeIea