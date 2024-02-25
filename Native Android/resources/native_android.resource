*** Settings ***
Library      AppiumLibrary
Library    DateTime

*** Variables ***
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     14
${URL}      http://localhost:4723/wd/hub  # URL do servidor Appium
${expected_model}    SM-F731B

*** Keywords ***

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
    ${current_min}    Evaluate    ${current_min} + 2
    Input Text    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.RelativeLayout/android.widget.ScrollView/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.TimePicker/android.widget.LinearLayout/android.widget.LinearLayout/android.widget.LinearLayout[2]/android.widget.EditText    text=${current_min} 
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
    Sleep     120
    Capture Page Screenshot


    
