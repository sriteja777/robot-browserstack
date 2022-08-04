*** Settings ***
Library    SeleniumLibrary
Resource    ../config/KeywordsFile.robot

*** Keywords ***
Login
    Add Implicit Wait
    Get the page title
    Click on Sign In
    Enter Credentials   demouser    testingisfun99
    Click on Login
    Verify username     demouser

Add to Cart
    Add Implicit Wait
    Get the page title
    Add first product to cart
    Verify product is added to cart
