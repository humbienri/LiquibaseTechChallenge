*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${RESULTS_FILTER_LOCATOR}    xpath://mat-select//./span[starts-with(@class , 'mat-select-placeholder')][text() = 'Result']
${RESULT_TYPE_PASS_OPTION_LOCATOR}    xpath://span[contains(text(), 'Pass')]/ancestor::mat-option
${OPERATIONS_LIST_LOCATOR}    xpath://lhw-operations-list
${OPERATIONS_LISTING_TITLE_LOCATOR}    css:lhw-operations-list mat-panel-title
${OPERATIONS_LISTING_MESSAGE_LOCATOR}    css:div.mat-expansion-panel-body    


*** Keywords ***
Filter Operations by Result
    [Arguments]    ${result_type}
    
    Sleep  1s    #TODO: flicker of the filter
    
    Wait Until Element Is Visible    ${RESULTS_FILTER_LOCATOR}
    Click Element    ${RESULTS_FILTER_LOCATOR}

    Click Element    ${RESULT_TYPE_PASS_OPTION_LOCATOR}
    
    # ${tmp}=    Get Text
    # Click Element    css:lhw-operations-list mat-panel-title
    # ${page_count}=    Get Text    css:div.operations-dashboard__paginator div.mat-paginator-range-label
    # ${tmp}=    Get Text    css:div.mat-expansion-panel-body

Expand Operations List
    Click Element    ${OPERATIONS_LIST_LOCATOR}

# ASSERTION KWs
No Operations Listed
    [Documentation]
    Wait Until Element Is Visible    ${OPERATIONS_LISTING_TITLE_LOCATOR}
    Element Should Contain    ${OPERATIONS_LISTING_TITLE_LOCATOR}    No Operations
    # Wait Until Element Is Visible    css:div.mat-expansion-panel-body
    Element Should Contain    ${OPERATIONS_LISTING_MESSAGE_LOCATOR}    any Operations
