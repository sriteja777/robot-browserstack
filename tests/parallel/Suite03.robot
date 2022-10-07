*** Settings ***
Library    SeleniumLibrary
Library    ../../config/Config.py
Resource   ../../config/KeywordsFile.robot
Resource    ../testcases.robot
Test Setup    Execute test
Test Teardown    Close Session

*** Variables ***
${website_url}=    https://bstackdemo.com

*** Keywords ***
Execute test
    ${test_caps}=   get test caps   2
    Open Session    ${test_caps}    ${website_url}


*** Test Cases ***
Add to Cart Test
    Add to Cart
