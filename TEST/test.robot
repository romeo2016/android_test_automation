*** Settings ***
Library                                        RequestsLibrary
Library                                        AppiumLibrary



*** Variables ***
# ${REMOTE_URL}          http://localhost:4723/wd/hub
${PLATFORM_NAME}       Android
${DEVICE_NAME}         emulator-5554
${AUTOMATION_NAME}     UiAutomator2
${APP_PATH}            ${EXECDIR}${/}non_mfi_build.apk
${APP_PACKAGE}         com.multisys.append.develop
${APP_ACTIVITY}        com.multisyscorp.superapp.ui.splash.SplashActivity


*** Keywords ***
Open the AppendPay app on Android
    Open Application    http://localhost:4723
    ...                 platformName=${PLATFORM_NAME}
    ...                 deviceName=${DEVICE_NAME}
    ...                 automationName=${AUTOMATION_NAME} 
    ...                 appPackage=${APP_PACKAGE}
    ...                 appActivity=${APP_ACTIVITY}    
    ...                 uiautomator2ServerInstallTimeout=60000              


*** Test Cases ***
Verify "Gumawa ng account" Button is Visible
    Open the AppendPay app on Android
    Wait Until Element Is Visible            //android.widget.Button[@resource-id="com.multisys.append.develop:id/btn_register"]
    Sleep                                    5s
    Close Application