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
# ${WELCOME URL}       http://${SERVER}/welcome.html
# ${ERROR URL}         http://${SERVER}/error.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    # Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    # Login Page Should Be Open

# Login Page Should Be Open
#     Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    # Login Page Should Be Open
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
    # Wait For Condition    Page Should Contain    Please Input
    # Wait For Condition    Page Should Contain    Welcome to SSD(SoftSIM Download) system backend.
    # Wait For Condition    return window.document.title == 'GreenRoam'
    # Wait Until Page Contains Element    <p>Welcome to SSD(SoftSIM Download) system backend.</p>
    # Location Should Be     http://${SERVER}/#/main

# Welcome Page Should Be Open
#     Location Should Be    ${WELCOME URL}
#     Title Should Be    Welcome Page
