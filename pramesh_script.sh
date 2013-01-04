##################################################################################################################
#   This is program for displaying a MAIN MENU after as per User option selection corresponding action will be   #
#                                  performed upto the user selected exit option (8)                              #
##################################################################################################################
#pramesh_script.sh
#!/bin/bash
while true                                                                 #checking the loop for true
do                                                                         #start of while loop
clear
  echo " select the option between 1 to 8  "                               # starting of display menu option
	echo "####################################" 
	echo "# MAIN MENU                        #"
	echo "# 1.Change password                #"
	echo "# 2.To see disk space              #"
	echo "# 3.Login to other host using ssh  #"
	echo "# 4.Show all service running       #"
	echo "# 5.Show all ports opened          #"
	echo "# 6.Show all java apps running     #"
	echo "# 7.To kill the application        #"
	echo "# 8.Exit                           #"
	echo "####################################"                            # end of main menu option

	echo "enter the option [1-8]:"                                         # select the option between 1 to 8
	tput cup 13 19 :                                               
	read option                                                            # read the entered option

	    case "$option" in                                                  # stat of case statemnet

		1)echo "enetr username to chnage password"                           # start of option 1 
		  read username
		  passwd $username
		  sleep 3;                                                           # sleep for 3 sec to display output
		  ;;                                                                 # end of the option 1

		2)echo "Disk space using"						                                 # start of option2 and display message
              df -H                                                      # display disk space
		  sleep 3;                                                           # sleep for 3 sec to display output
		  ;;                                                                 # end of option 2

		3)echo "enter hostname or ip-address"                               # start of option 3 and display message    
		  read gethostname                                                  # reading hostanme or ip address
              echo "enter username"                                     # display message for username
              read uname                                                # reading username
		  ssh $uname@$gethostname                                           # connecting host by using ssh
		  sleep 2;                                                          # sleep for 2 sec to display output
		  ;;                                                                # end of option 3

		4)echo "press space bar key to continue and Ctrl+c to exit"         # start of option 4 and display message how to proceed
		  sleep 2;                                                          # sleep for 2 sec to display message
		  ps -ef | more                                                     # display the services running
		  sleep 3;                                                          # sleep for 3 sec to display output
		  ;;                                                                # end of option 4

		5)echo "press space bar key to continue and Ctrl+c to exit"         # start of option 5 and display message how to proceed
		  sleep 2;                                                          # sleep for 2 sec to disply message how to processd
		  netstat -a | egrep -i "CONNECTED | LISTEN " | more                # displaying howmany ports are connected
		  sleep 3;                                                          # sleep for 3 sec to display output
		  ;;							                                                  # end of option 5

		6)echo "displaying java applications running"                       # start of option 6
      ps -ef | grep -i "java"                                           # display all java programs running
		  sleep 3;					                                                # sleep for 3 sec to display output
		  ;;                                                                # end of option 6

    7)echo "enter the application name to be killed"                    # start of option 7 and display message
		  read getaplname                                                   # reading process name
		  killall $getaplname					      	                              # killing the application
		  sleep 3;                                                          # sleep for 3 sec to display output
		  ;;                                                                # end of option 7

		8)echo "exiting script"                                             # start of option 8 and display message
		  sleep 1;						      # sleep for 1 sec
		  exit                                                              # exiting
		  clear                                                             # clearing the screen
		  ;;                                                                # end of option 8

		*)echo "enter valid option [1-8]"                                   # display message for 
		  sleep 2;;                                                         # sleeping 2 sec

	  esac                                                                # end of case statement
done                                                                    # end of while loop
