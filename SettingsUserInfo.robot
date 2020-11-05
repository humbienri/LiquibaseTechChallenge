*** Settings ***
Library   SeleniumLibrary


*** Variables ***
${FIRST_NAME_LOCATOR}    css:input#mat-input-3
${URL_FIELD_LOCATOR}    css:input#mat-input-8
${MIDDLE_NAME_LOCATOR}    css:input#mat-input-4
${LAST_NAME_LOCATOR}    css:input#mat-input-5
${BIOGRAPHY_LOCATOR}    css:textarea#mat-input-10

*** Keywords ***
Enter First Name
    [Arguments]    ${first_name}
    Wait Until Element Is Enabled    ${FIRST_NAME_LOCATOR}
    Input Text    ${FIRST_NAME_LOCATOR}    ${first_name}

Enter Last Name
    [Arguments]    ${last_name}
    # Wait Until Element Is Enabled    css:input#mat-input-5
    Input Text    ${LAST_NAME_LOCATOR}    ${last_name}

Enter Middle Name
    [Arguments]    ${middle_name}
    # Wait Until Element Is Enabled    css:input#mat-input-5S
    Input Text    ${MIDDLE_NAME_LOCATOR}    ${middle_name}

Enter URL
    [Arguments]    ${url}
    Input Text    ${URL_FIELD_LOCATOR}    ${url}

Enter Company
    [Arguments]    ${company_name}
    Input Text    css:input#mat-input-9    ${company_name}

Enter Biography
    [Arguments]    ${biography}
    Input Text    ${BIOGRAPHY_LOCATOR}    ${biography}

Update User Profile
    Click Element    css:form button
    Wait Until Page Contains Element    css: form button[disabled='true']
    # Sleep    5s

#  ASSERTIONS
Company Name Should Be
    [Arguments]    ${company_name}
    Wait Until Element is Visible    css:input#mat-input-9
    # ${tmp}=    Execute Javascript    return document.querySelector('#mat-input-9').value
    Wait For Condition    return document.querySelector('#mat-input-9').value == '${company_name}';
    # Element Should Contain    css:input#mat-input-9    Co_${RANDOM_MARKER_STRING}

First Name Should Be
    [Arguments]    ${first_name}
    Wait Until Element is Visible    ${FIRST_NAME_LOCATOR}
    Wait For Condition    return document.querySelector('${FIRST_NAME_LOCATOR.replace('css:' , '' , 1)}').value == '${first_name}';

URL Should Be
    [Arguments]    ${url}
    Wait Until Element is Visible    ${URL_FIELD_LOCATOR}
    Wait For Condition    return document.querySelector('${URL_FIELD_LOCATOR.replace('css:' , '' , 1)}').value == '${url}';

Middle Name Should Be
    [Arguments]    ${middle_name}
    Wait Until Element is Visible    ${MIDDLE_NAME_LOCATOR}
    Wait For Condition    return document.querySelector('${MIDDLE_NAME_LOCATOR.replace('css:' , '' , 1)}').value == '${middle_name}';

Last Name Should Be
    [Arguments]    ${last_name}
    Wait Until Element is Visible    ${LAST_NAME_LOCATOR}
    Wait For Condition    return document.querySelector('${LAST_NAME_LOCATOR.replace('css:' , '' , 1)}').value == '${last_name}';

Biography Should Be
    [Arguments]    ${biography}
    Wait Until Element is Visible    ${BIOGRAPHY_LOCATOR}
    Wait For Condition    return document.querySelector('${BIOGRAPHY_LOCATOR.replace('css:' , '' , 1)}').value == '${biography}';
