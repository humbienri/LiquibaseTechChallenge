*** Settings ***
Library   SeleniumLibrary   30s    # edit this back 'n forth between 30 seconds for RUNnin' yet only 10 for DEV'ing
Library    String

Resource    Landing.robot
Resource    SettingsUserInfo.robot
Resource    BusinessOverview.robot

Suite Setup    Login to the HUB    ${BASE_URL}    ${BROWSER}    ${USER_NAME}    ${SECRET}
Test Setup    Generate Random Marker


*** Variables ***
${BASE_URL}    https://hub-staging.liquibase.com/landing-page
${BROWSER}    chrome
${RANDOM_MARKER_STRING}    ${EMPTY}
${USER_NAME}    STEApplicant1
${SECRET}    RB9hJFRp69nojtNvsgt*


*** Keywords ***
Generate Random Marker
    ${random_string}    Generate Random String    9    [LETTERS]
    Set Suite Variable    ${RANDOM_MARKER_STRING}    ${random_string}

*** Test Cases ***
Edit User Profile
    [Documentation]
    Go to Settings
    Go to User Information

    Enter First Name    OsCar_${RANDOM_MARKER_STRING}
    Enter Middle Name    The_${RANDOM_MARKER_STRING}
    Enter Last Name    Grouch_${RANDOM_MARKER_STRING}
    Enter URL    URL_${RANDOM_MARKER_STRING}
    Enter Company    Co_${RANDOM_MARKER_STRING}
    Enter Biography    Bio_${RANDOM_MARKER_STRING}

    Update User Profile

# VERIFICATIONS
    Company Name Should Be    Co_${RANDOM_MARKER_STRING}
    First Name Should Be    OsCar_${RANDOM_MARKER_STRING}
    URL Should Be    URL_${RANDOM_MARKER_STRING}
    Middle Name Should Be    The_${RANDOM_MARKER_STRING}
    Last Name Should Be    Grouch_${RANDOM_MARKER_STRING}
    Biography Should Be    Bio_${RANDOM_MARKER_STRING}


Zero Operations by Default
    [Documentation]
    Go to Projects
    Go to Operations
    Filter Operations by Result    Pass
    Expand Operations List
    No Operations Listed 

