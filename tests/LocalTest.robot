*** Settings ***
Library         SeleniumLibrary
Library    ../config/Config.py
Resource        ../config/KeywordsFile.robot
Test Setup      Execute local test
Test Teardown   Close Session

*** Variables ***
${local_website_url}=   http://bs-local.com:45691/check

*** Keywords ***
Execute local test
    ${test_caps}=   get test caps   0
    Open Session    ${test_caps}    ${local_website_url}

*** Test Cases ***
Local Test
    Add Implicit Wait
    Verify site content
