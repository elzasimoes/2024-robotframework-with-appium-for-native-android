import subprocess

appium_command = 'appium --allow-insecure=adb_shell'

robot_command = 'robot .'

try:
    appium_process = subprocess.Popen(appium_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

    robot_process = subprocess.Popen(robot_command, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    robot_process.communicate() 

finally:
    if appium_process:
        appium_process.terminate()