*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          ../resource.robot

*** Test Cases ***
Valid Login
    DoLogin
    Click User Mange Page
    [Teardown]    Close Browser

*** Keywords ***
Click User Mange Page
    Wait For Condition    return $('div:contains(Administration)').length > 0
    Click Element    dom=$('div li a:contains(Administration)')[0]
    Click Element    dom=$('div li a:contains(User)')[0]
    Wait For Condition    return $('select option').length > 0
    Select From List    dom=$('select[ng-model="query.user_type__regex"]')[0]    Operation
    Click Element    dom=$('button:contains(Query)')[0]
    Wait For Condition    return $('table tr[ng-repeat="item in userList"]').length > 0
    Click Element    dom=$('button.glyphicon.glyphicon-forward')[0]
    Wait For Condition    return $('table tr[ng-repeat="item in userList"]').length > 0
