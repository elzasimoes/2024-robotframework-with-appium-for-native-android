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
    # Click Element    xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.LinearLayout[3]/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout[3]/android.widget.RelativeLayout
    Execute Adb Shell    shell am start -n com.sec.android.app.sbrowser/com.sec.android.app.sbrowser.SBrowserMainActivity
    
    