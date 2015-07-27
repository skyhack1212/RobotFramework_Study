.. code:: robotframework

    *** Variables ***
    ${BROWSER}    chrome

    *** Test Cases ***
    User can create an account and log in
        Create Valid User    fred    P4ssw0rd
        Attempt to Login with Credentials    fred    P4ssw0rd
        Status Should Be    Logged In

    User cannot log in with bad password
        Create Valid User    betty    P4ssw0rd
        Attempt to Login with Credentials    betty    wrong
        Status Should Be    Access Denied

    Let me add a new TestCase for demo
        Create Valid User    betty    P4ssw0rd
        Status Should Be    SUCCESS
        Log Many    123    1231322
        Create Directory    testFolder
        ${tmp} =    RUN    ls -al
        Log    ${tmp}

    Let me Test HTTP Request for demo
        Create HTTP Context    www.hinet.net
        GET    /
        Response Status Code Should Equal    200

    Let me Test by Selenium
        Open Browser  https://abc.cde.efg  ${BROWSER}
        Maximize Browser Window
        Title Should Be    a123
        Input Text    identifier=username    myUsername
        Input Password    identifier=password    myPassword
        Click Button    dom=document.querySelector('[ng-click="submit()"]')
        Wait Until Page Contains    Welcome to SXD
        Capture Page Screenshot    LoginSuccessLog.png
        Close Window

.. code:: robotframework

    *** Settings ***
    Library           HttpLibrary.HTTP
    Library           OperatingSystem
    Library           lib/LoginLibrary.py
    Library           Selenium2Library

.. code:: robotframework

    *** Keywords ***
    Clear login database
        Remove file    ${DATABASE FILE}

    Create valid user
        [Arguments]    ${username}    ${password}
        Create user    ${username}    ${password}
        Status should be    SUCCESS

    Creating user with invalid password should fail
        [Arguments]    ${password}    ${error}
        Create user    example    ${password}
        Status should be    Creating user failed: ${error}

    Login
        [Arguments]    ${username}    ${password}
        Attempt to login with credentials    ${username}    ${password}
        Status should be    Logged In

    # Keywords below used by higher level tests. Notice how given/when/then/and
    # prefixes can be dropped. And this is a commend.

    A user has a valid account
        Create valid user    ${USERNAME}    ${PASSWORD}

    She changes her password
        Change password    ${USERNAME}    ${PASSWORD}    ${NEW PASSWORD}
        Status should be    SUCCESS

    She can log in with the new password
        Login    ${USERNAME}    ${NEW PASSWORD}

    She cannot use the old password anymore
        Attempt to login with credentials    ${USERNAME}    ${PASSWORD}
        Status should be    Access Denied
