*** Settings ***
Resource        ./resources/native_android.resource
Suite Setup      Initialize Device

Test Setup     Initialize Test
Test Teardown    Close All Apps

*** Test Cases ***
01 - Verify Samsung Browser 
    [Documentation]     Verify Samsung Browser
    Open Samsung Browser
    Search Google in Samsung Browser

02 - Set Alarm
    [Documentation]    Set alarm for 2 minutes from now and detect when it alarms
    FOR    ${counter}    IN RANGE    0    10  
        Open Clock
        Click Set Alarm Button
        Set Alarm Name
        Set Alarm in 2 minutes
        Save Alarm
        Detect Alarm
    END

03 - Verify Model
    [Documentation]     Checks if the model is as expected
    Get Model

04 - Verify Sales Code
    [Documentation]     Returns sales code
    Get Sales Code

    



 