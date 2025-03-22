*** Settings ***
Library    SeleniumLibrary
Resource   selenium_resource.robot
*** Test Cases ***
Test Scenario - Login as Admin
    Open Browser and test    
    Enter username and password    Admin    admin123