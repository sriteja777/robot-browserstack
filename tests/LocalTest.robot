*** Settings ***
Library    SeleniumLibrary
Library     Collections
Library    ../config/manage-local-testing.py
Library    ../config/Config.py
Resource    ../config/KeywordsFile.robot
Test Setup    Setup for local test
Test Teardown    Teardown for local test

*** Variables ***
${local_url}=    http://bs-local.com:45691/check

*** Keywords ***
Setup for local test
    START LOCAL
    ${final_caps}=    combine caps    0    ${TEST NAME}
    Open Session    ${final_caps}    ${local_url}

Teardown for local test
    Close Session
    STOP LOCAL

*** Test Cases ***
Local Test
    Add Implicit Wait
    Verify site content
