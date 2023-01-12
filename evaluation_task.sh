#!/bin/bash

# Initialize the counter
counter=3

# While loop to give the user 3 attempts if the input is invalid
while [ $counter -ge 1 ]; do

  # User selection to start an application
  echo "Enter which application to start:"
  echo "1. Application 1"
  echo "2. Application 2"
  echo "3. Application 3"

  # Reads the user's input
  read input

  # Download the selected application(s) and start using supervisor
  if [[ $input =~ ^[123]+$ ]]; then
    
    #Creating Evaluation_Task_Dir to store all the files in HOME dir
    mkdir $HOME/Evaluation_Task_Dir/

    #Creating supervisord.conf file by copying the output of echo_supervisord_conf
    echo_supervisord_conf > $HOME/Evaluation_Task_Dir/supervisord.conf 
    
    #Editing supervisord.conf file to add the processes to monitor.
    echo "" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "[program:Application1]" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "command=$HOME/Evaluation_Task_Dir/Application1" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "autostart=false" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "autorestart=false" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "stderr_logfile=$HOME/Evaluation_Task_Dir/Application1.err" >> $HOME/Evaluation_Task_Dir/supervisord.conf 
    echo "stdout_logfile=$HOME/Evaluation_Task_Dir/Application1.out" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "" >> $HOME/Evaluation_Task_Dir/supervisord.conf

    echo "[program:Application2]" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "command=$HOME/Evaluation_Task_Dir/Application2" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "autostart=false" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "autorestart=false" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "stderr_logfile=$HOME/Evaluation_Task_Dir/Application2.err" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "stdout_logfile=$HOME/Evaluation_Task_Dir/Application2.out" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "" >> $HOME/Evaluation_Task_Dir/supervisord.conf

    echo "[program:Application3]" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "command=$HOME/Evaluation_Task_Dir/Application3" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "autostart=false" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "autorestart=false" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "stderr_logfile=$HOME/Evaluation_Task_Dir/Application3.err" >> $HOME/Evaluation_Task_Dir/supervisord.conf
    echo "stdout_logfile=$HOME/Evaluation_Task_Dir/Application3.out" >> $HOME/Evaluation_Task_Dir/supervisord.conf 
    
    # Starts supervisor
    supervisord -c $HOME/Evaluation_Task_Dir/supervisord.conf
    supervisorctl reread
    
    for i in $(seq 1 ${#input}); do
      case ${input:i-1:1} in
        1)
          # Download and start Application 1
          curl -o $HOME/Evaluation_Task_Dir/Application1  \
           -H "Accept: application/vnd.github.raw" \
           -H "Authorization: Bearer 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"\
           -H "X-GitHub-Api-Version: 2022-11-28" \
          https://api.github.com/repos/tenzin7/Evaluataion-Task-applications/contents/test_app_1_darwin_arm64
          chmod +x $HOME/Evaluation_Task_Dir/Application1
          supervisorctl update Application1
          supervisorctl start Application1
          ;;
        2)
          # Download and start Application 2
          curl -o $HOME/Evaluation_Task_Dir/Application2  \
           -H "Accept: application/vnd.github.raw" \
           -H "Authorization: Bearer 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"\
           -H "X-GitHub-Api-Version: 2022-11-28" \
          https://api.github.com/repos/tenzin7/Evaluataion-Task-applications/contents/test_app_2_darwin_arm64
          chmod +x $HOME/Evaluation_Task_Dir/Application2
          supervisorctl update Application2
          supervisorctl start Application2
          ;;
        3)
          # Download and start Application 3
          curl -o $HOME/Evaluation_Task_Dir/Application3  \
           -H "Accept: application/vnd.github.raw" \
           -H "Authorization: Bearer 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"\
           -H "X-GitHub-Api-Version: 2022-11-28" \
          https://api.github.com/repos/tenzin7/Evaluataion-Task-applications/contents/test_app_3_darwin_arm64
          chmod +x $HOME/Evaluation_Task_Dir/Application3
          supervisorctl update Application3
          supervisorctl start Application3
          ;;
      esac
    done
    break
  else
    echo "Invalid input. Please try again."
    counter=$(( $counter-1 ))
    echo "$counter: Attempt Remaining"
  fi
done