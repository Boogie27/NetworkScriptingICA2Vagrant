Network Scripting ICA 2
======================

1. How to run vagrant
---------------------
# Open up the root folder of the ICA
# click option then open gitbash 
# run vagrant up to install the VM
# run vagrant up again
# run vagrant ssh


The vagrant is being configured to import content of ./data folder into the root folder of vagrant
as soon as vagrant has finished installing VM and Centos7.

On the root folder or working directory, there are 3 three different files, The index.php, make_staff_database.sql, 
setup_lamp.sh and then the gen_serenity.sh file.


The setup_lamp.sh file  contains all the configurations needed to install and run apache, mysql and the query the make_staff_database.
it also contains codes for file manipulations, creation of users and groups, assigning users to groups and many more functions
as the ICA specifications has required.

2. How to install neccessary dependencies and programs
------------------------------------------------------
# run bash setup_lamp.sh


3. How to exit from VM
----------------------
# run exit

4. How to delete VM
----------------------
# run vagrant destroy

5. How to close VM
----------------------
# run vagrant halt