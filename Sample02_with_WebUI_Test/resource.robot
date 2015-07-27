*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}            127.0.0.1:4444
${BROWSER}           Firefox
${DELAY}             0
${VALID USER}        admin
${VALID PASSWORD}    admin
${LOGIN URL}         http://${SERVER}/#/login

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Go To Login Page
    Go To    ${LOGIN URL}
    [Arguments]    ${username}
    Input Text    name=username    ${username}

Input Username
    [Arguments]    ${username}
    Input Text    name=username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Login
    Click Button    xpath=//button[@ng-click='submit()']

Check URL After Login
    Wait For Condition    return $('div:contains(Taisys SSD)').length > 0

DoLogin
    Open Browser To Login Page
    Input Username    admin
    Input Password    admin
    Submit Login
    Check URL After Login
