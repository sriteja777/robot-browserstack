*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/KeywordsFile.robot
Resource        ../resources/TestCases.robot
Test Setup      Execute test
Test Teardown   Close Session


*** Variables ***
${website_url}=     https://bstackdemo.com
&{test_caps}        browser=firefox


*** Keywords ***
Execute test
    Open Session    ${test_caps}    ${website_url}


*** Test Cases ***
Add to Cart Test 2
    Add to Cart
