*** Settings ***
Resource        ./resources/native_android.resource
# Suite Setup      Open Application
# Suite Teardown      Close Application

*** Test Cases ***
01 - Verify Samsung Browser
    [Documentation]     Verify Samsung Browser
    Open Application    ${URL}        platformName=${PLATFORM_NAME}     
    Execute Adb Shell    input keyevent KEYCODE_HOME
    Execute Adb Shell       am start -a android.settings.SETTINGS
    Wait Until Page Contains    text=Conexões
    Capture Page Screenshot
    Execute Adb Shell    am start -n com.sec.android.app.sbrowser/com.sec.android.app.sbrowser.SBrowserMainActivity
    Click Element    id=com.sec.android.app.sbrowser:id/location_bar_edit_text
    Input Text    id=com.sec.android.app.sbrowser:id/location_bar_edit_text    text=www.google.com
    Execute Adb Shell    input keyevent ENTER
    ${serial_number}    Execute Adb Shell    getprop ro.product.model
    Log    ${serial_number}
    


    
    