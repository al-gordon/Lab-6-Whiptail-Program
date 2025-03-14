#!/bin/bash
 
while true; do
# 2.1 - proceed to program or exit
    whiptail --title "Menu" --yesno "Proceed to program or exit?" 10 50
    #checks user input
    if [ $? -eq 0 ]; then
    
# 2.2 - Second screen presents menu 
        choice=$(whiptail --title "Menu" --menu "Choose a tool:" 15 50 4 \
            "1" "Use AWK" \
            "2" "Use GREP" \
            "3" "Exit" 3>&1 1>&2 2>&3)
 
# 2.3 - When user selects AWK gives text box to enter name of file to use
        if [ "$choice" == "1" ]; then
            filename=$(whiptail --title "Menu" --inputbox "Enter the name of the file you wish to awk:" 10 50 3>&1 1>&2 2>&3)
            #2.6 function returns awk of the second column of the chosen file
            output=$(awk -F, '{print $2}' "$filename" | tr -d '\r')
            whiptail --title "AWK Result" --msgbox "$output" 20 50
        fi
 
# 2.4 - When user selects GREP given text box to name the file to use 
        if [ "$choice" == "2" ]; then
            filename=$(whiptail --title "Menu" --inputbox "Enter the name of the file you wish to grep:" 10 50 3>&1 1>&2 2>&3)
            #2.7 function wil search for any line including letter 'e'. 
            output=$(grep 'e' "$filename" | tr -d '\r')
            whiptail --title "GREP Result" --msgbox "$output" 20 50
        fi
        
        if [ "$choice" == "3" ]; then
            exit 0
        fi
 
# 2.8 - once menu function finished returns to menu on 'fi' created at 2.1
    else
    #on choice 3 ends program (yes = 0, no = 1) 
        exit 1
    fi
done
