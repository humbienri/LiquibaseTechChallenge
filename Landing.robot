*** Settings ***
Library   SeleniumLibrary   30s    # edit this back 'n forth between 30 seconds for RUNnin' yet only 10 for DEV'ing
Library    String

Resource    Login.robot


*** Variables ***
${BASE_URL}    https://hub-staging.liquibase.com/landing-page
${BROWSER}    chrome
${LOGIN_BUTTON}    xpath://lhw-landing-page//./button//./span[contains(text(), 'Log In')]
${GETTING_STARTED_DIALOG_CLOSE_LOCATOR}    xpath://div[starts-with(@id , 'cdk-overlay')]//./mat-icon[text() = 'close']
# //mat-select//./span[starts-with(@class , 'mat-select-placeholder')][text() = 'Result']
# //mat-select//./span[starts-with(@class , 'mat-select-placeholder')][contains(text() , 'XXXXXXX')]
# //div[starts-with(@id , 'cdk-overlay')]
# //lhw-sidenav//./mat-icon[text() = 'account_tree']    account_tree, business, settings
${SIDE_NAV_ICON_LOCATOR_SETTINGS}    xpath://lhw-sidenav//./mat-icon[text() = 'settings']/../..
${SIDE_NAV_ICON_LOCATOR_PROJECTS}    xpath://lhw-sidenav//./mat-icon[text() = 'account_tree']/../..
# ${side_nav_icon_locator_settings}    xpath://mat-icon[text() = 'settings']/../..

*** Keywords ***
Login to the HUB
    [Documentation]    Temporarily
    [Arguments]    ${url}    ${browser}    ${user_name}    ${user_password}
    Open Browser     ${url}    ${browser}

    Sleep    3s    #TODO: nail this down...logging in but staying on login page

    Wait Until Element Is Enabled    ${login_button}
    Click Element    ${login_button}
    
    Enter Username    ${user_name}
    Enter Password    ${user_password}
    Log In

    # Maximize Browser Window
Disable Tooltips
    # Sleep    5s
    # Click Element    css:input#mat-slide-toggle-2-input    #lhw-footer label.mat-slide-toggle-label
    Click Element    css:lhw-footer label.mat-slide-toggle-label

Dismiss Getting Started Dialog
    Wait Until Element Is Visible    ${getting_started_dialog_close_locator}
    Click Element    ${getting_started_dialog_close_locator}
    

Go to Settings
    [Documentation]    Temporarily
    # Wait Until Element Is Visible    ${side_nav_icon_locator_settings}
    Wait Until Element Is Enabled    ${SIDE_NAV_ICON_LOCATOR_SETTINGS}
    Click Element    ${SIDE_NAV_ICON_LOCATOR_SETTINGS}

Go to Projects
    [Documentation]    Temporarily
    Wait Until Element Is Enabled    ${SIDE_NAV_ICON_LOCATOR_PROJECTS}
    Click Element    ${SIDE_NAV_ICON_LOCATOR_PROJECTS}

Go to Operations
    # expand default project
    Wait Until Element Is Visible    css:lhw-projects-tree button
    Click Element    css:lhw-projects-tree button

    # go to Operations
    Wait Until Element Is Visible    css:lhw-projects-tree div.projects-tree__item__route
    Click Element    css:lhw-projects-tree div.projects-tree__item__route

Go to User Information
    [Documentation]    Temporarily
    Wait Until Element Is Enabled    xpath://div[text() = 'User Info']/..
    Click Element    xpath://div[text() = 'User Info']

Go to API Keys
    Wait Until Element Is Enabled    xpath://div[text() = 'API Keys']/..
    Click Element    xpath://div[text() = 'API Keys']

