*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}    chrome
${USERNAME_TEXTFIELD}    css:input[name=username]
${PASSWORD_TEXTFIELD}    css:input[name=password]
${LOGIN_BUTTON}    css:button[type=submit]
${TIMEOUT}    15s
${DASHBOARD_TITLE}    xpath://span[contains(.,'Dashboard')]
*** Keywords ***
Open Browser and test
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${LOGIN_BUTTON}
Enter username and password
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${USERNAME_TEXTFIELD}    ${TIMEOUT}
    Input Text    ${USERNAME_TEXTFIELD}    ${username}   
    Input Text    ${PASSWORD_TEXTFIELD}    ${password}
    Click Element    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${DASHBOARD_TITLE}    ${TIMEOUT}
    @{elements}=    Get WebElements    ${DASHBOARD_TITLE}    
    ${count}=    Get Element Count     ${DASHBOARD_TITLE}
    Log    Found ${count} Element

    FOR    ${index}    ${element}    IN ENUMERATE    @{elements}
        ${text}=    Get Text    ${element}
        ${class_value}=    Get Element Attribute    ${element}    class
        IF    'oxd-main-menu-item' in '${class_value}'
            Log    Element ${index} text: ${text} class:${class_value}
            Click Element    ${element}
            Exit For Loop
        ELSE
            Log    No elements with Dashboard text found
        END
    END

Login as Admin
    [Arguments]    ${username}    ${password}
    Open Browser and test
    Enter username and password    ${username}    ${password}
    
