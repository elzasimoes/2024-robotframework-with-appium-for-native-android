*** Settings ***
Library      AppiumLibrary
Library    DateTime

*** Variables ***
${URL}      http://127.0.0.1:4723
${expected_model}    SM-F731B
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=14}

*** Keywords ***
Initialize Device
  Open Application      ${URL}      automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}      platformVersion=${ANDROID_PLATFORM_VERSION}

Initialize Test
    Go To Home Screen
    ConnectWifi
    Close All Apps

ConnectWifi
    ${network_status}    Get Network Connection Status
    IF    ${network_status} == 2
        Pass Execution    Wifi Connected
    ELSE
        Set Network Connection Status    connectionStatus=6
    END
    
Go To Home Screen
    Execute Adb Shell    input keyevent KEYCODE_HOME

Open Settings
    Execute Adb Shell       am start -a android.settings.SETTINGS
    Wait Until Element Is Visible    id=com.android.settings:id/collapsing_appbar_title_layout_parent

Open Samsung Browser
    Execute Adb Shell    am start -n com.sec.android.app.sbrowser/com.sec.android.app.sbrowser.SBrowserMainActivity
    Wait Until Element Is Visible    id=com.sec.android.app.sbrowser:id/location_bar_edit_text
    
Search Google in Samsung Browser
    Click Element    id=com.sec.android.app.sbrowser:id/location_bar_edit_text
    Input Text    id=com.sec.android.app.sbrowser:id/location_bar_edit_text    text=www.google.com
    Execute Adb Shell    input keyevent ENTER

Get Model
    ${test_model}    Execute Adb Shell    getprop ro.product.model
    Log    ${test_model}  
    ${stripped_model} =  Set Variable  ${test_model.strip()}
    Should Be Equal     ${stripped_model}     ${expected_model} 

Close All Apps
    Execute Adb Shell    input keyevent 187
    ${any_app_open}=    Run Keyword And Return Status    Element Should Be Visible    id=com.sec.android.app.launcher:id/clear_all
    Run Keyword If       ${any_app_open}   Click Element    id=com.sec.android.app.launcher:id/clear_all
    Go To Home Screen 

Open Clock
    Execute Adb Shell        monkey -p com.sec.android.app.clockpackage 1
    Wait Until Element Is Visible    id=com.sec.android.app.clockpackage:id/menu_alarm_add

Click Set Alarm Button
    Click Element    id=com.sec.android.app.clockpackage:id/menu_alarm_add
    Capture Page Screenshot

Set Alarm in 2 minutes
    Click Element    id=com.sec.android.app.clockpackage:id/numberpicker_input
    ${current_hour}    Get Current Date    result_format=%H
    Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.TimePicker/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout[1]/android.widget.EditText    text=${current_hour}
    Execute Adb Shell    input keyevent 66
    ${current_min}    Get Current Date    result_format=%M
    ${current_min_treat}    Evaluate    int(${current_min})
    ${final_value}    Evaluate    ${current_min_treat} + 2
    Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.TimePicker/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.EditText    text=${final_value} 
    Execute Adb Shell    input keyevent 66
    
Set Alarm Name 
    Click Element     id=com.sec.android.app.clockpackage:id/alarm_name   
    Input Text    id=com.sec.android.app.clockpackage:id/alarm_name    text=Alarm Test
    Capture Page Screenshot
    Hide Keyboard

Save Alarm
    Sleep     1
    Click Element    id=com.sec.android.app.clockpackage:id/menu_done

Detect Alarm
    Capture Page Screenshot

Get Sales Code     
    ${sales_code}    Execute Adb Shell    getprop ro.csc.sales_code    
    Set Variable      ${sales_code.strip()}
    Log    ${sales_code}

    



    
