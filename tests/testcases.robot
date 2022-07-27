*** Settings ***
Library    SeleniumLibrary
Resource    ../config/KeywordsFile.robot

*** Keywords ***
Demouser
    Add Implicit Wait
    Click on Sign In
    Enter Credentials   demouser    testingisfun99
    Click on Login
    Verify username     demouser

Favuser
    Add Implicit Wait
    Click on Sign In
    Enter Credentials   fav_user    testingisfun99
    Click on Login
    Verify username     fav_user

Image not loading user
    Add Implicit Wait
    Click on Sign In
    Enter Credentials   image_not_loading_user    testingisfun99
    Click on Login
    Verify username     image_not_loading_user
