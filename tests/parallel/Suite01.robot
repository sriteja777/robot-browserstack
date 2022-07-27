*** Settings ***
Library    SeleniumLibrary
Resource   ../../config/KeywordsFile.robot
Resource   ../../config/ParallelCaps.robot
Resource    ../testcases.robot
Test Setup    Open Session    ${PARALLEL_CAPS_1}     ${WEBSITE_URL}
Test Teardown    Close Session

*** Variables ***
${WEBSITE_URL}=     https://bstackdemo.com

*** Test Cases ***
Demouser test
    Demouser

Favuser test
    Favuser

Image not loading user test
    Image not loading user
