*** Settings ***
Library   SeleniumLibrary   30s    # edit this back 'n forth between 30 seconds for RUNnin' yet only 10 for DEV'ing
Library    String

Resource    Landing.robot
Resource    SettingsUserInfo.robot
Resource    BusinessOverview.robot


*** Variables ***
${BASE_URL}    https://hub-staging.liquibase.com/landing-page
${BROWSER}    chrome
${LOGIN_BUTTON_LOCATOR}    css:input[name='signInSubmitButton']

*** Keywords ***
Enter Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    css:input#signInFormUsername
    Input Text    css:input#signInFormUsername    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    css:input#signInFormPassword    ${password}    

Log In
    Click Element    ${LOGIN_BUTTON_LOCATOR}    

    Dismiss Getting Started Dialog