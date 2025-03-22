*** Settings ***
Library    SeleniumLibrary
Resource   selenium_resource.robot
Library    DataDriver    file=test_data/orangehrm_test_credentials.csv    encoding=utf-8
Test Template    Login as Admin
*** Test Cases ***
Login testing using ${username} and ${password}    Admin    admin123    

*** Keywords ***
Login as Admin
    [Arguments]    ${username}    ${password}
    Open Browser and test
    Enter username and password    ${username}    ${password}
