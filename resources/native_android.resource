*** Settings ***
Library      AppiumLibrary

*** Variables ***
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     14
${URL}      http://localhost:4723/wd/hub  # URL do servidor Appium
${elemento} =    Get Element By Android UI Automator2    new UiSelector().text("Modos e Rotinas")