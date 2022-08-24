*** Settings ***
Library    SeleniumLibrary
Library     Collections
Library    ../../config/Config.py
Resource   ../../config/KeywordsFile.robot
Resource    ../testcases.robot
Test Setup    Execute test
Test Teardown    Close Session

*** Variables ***
${website_url}=    https://bstackdemo.com

*** Keywords ***
Execute test
    ${final_caps}=    combine caps    0    ${TEST NAME}
    Open Session    ${final_caps}    ${website_url}


*** Test Cases ***
Login Test
    Login

Add to Cart Test
    Add to Cart
