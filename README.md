# evaluation_task_solution

Instructions for using the solution of evaluation task: 

1. Make sure you have installed curl and supervisor on your system.
2. Clone the repository to your local machine.
3. Navigate to the directory where supervisor config files are stored: (it’s usually at /etc/supervisor/)
       1. Edit supervisord.conf file. 
       2. Copy commands from supervisor_configs.txt file and paste it at the end of supervisord.conf file.
       3. Path should be the path of your pwd and path where you want to store your log files. 
       4. Make sure that the directories specified in the PATH for log files be created.
4. In the evaluation_task.sh script, specify the PATH of your PWD.
5. Make the evaluation_task.sh script executable with chmod +x evaluation_task.sh.
6. Run the script with ./start_apps.sh.
7. Follow the prompts to select which application(s) to download and start.
8. The selected applications should now be running with the help of supervisor. 
9. Running status of the application can be checked with: “supervisorctl status” command. 
10. Error log files can be viewed at the PATH specified in the supervisord.conf file.
