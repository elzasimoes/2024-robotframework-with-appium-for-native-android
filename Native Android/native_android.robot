*** Settings ***
Resource        ./resources/native_android.resource
Suite Setup      Open Application    ${URL}        platformName=${PLATFORM_NAME}

Test Setup     Initialize Test
Test Teardown    Close All Apps

*** Test Cases ***
01 - Verify Samsung Browser 
    [Documentation]     Verify Samsung Browser
    Open Samsung Browser
    Search Google in Samsung Browser
    Get Model

02 - Set Alarm
    [Documentation]    Set alarm for 2 minutes from now and detect when it alarms
    Open Clock
    Click Set Alarm Button
    Set Alarm Name
    Set Alarm in 2 minutes
    Save Alarm
    Detect Alarm

    



 