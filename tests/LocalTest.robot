*** Settings ***
Library    SeleniumLibrary
Resource    ../config/KeywordsFile.robot
Resource    ../config/LocalCaps.robot
Test Setup    Setup for local test
Test Teardown    Teardown for local test

*** Variables ***
${WEBSITE_URL}=     http://bs-local.com:45691/check

*** Test Cases ***
Local Website
    Add Implicit Wait
    Verify site content
