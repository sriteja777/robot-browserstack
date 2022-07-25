*** Settings ***
Library    SeleniumLibrary
Resource    ../config/KeywordsFile.robot
Resource    ../config/SingleCaps.robot
Test Setup    Open Session    ${SINGLE_CAPS}     ${WEBSITE_URL}
Test Teardown    Close Session

*** Variables ***
${WEBSITE_URL}=     https://bstackdemo.com

*** Test Cases ***
Bstack Website Login
    Add Implicit Wait
    Click on Sign In
    Enter Credentials   demouser    testingisfun99
    Click on Login
    Verify username     demouser
    