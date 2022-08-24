*** Settings ***
Library    SeleniumLibrary
Library    mark-test-status.py

*** Variables ***
${remote_url}=    https://hub.browserstack.com/wd/hub

*** Keywords ***
Open Session
    [Arguments]    ${capabilities}    ${test_url}
    Create Webdriver    Remote    options=${capabilities}    command_executor=${remote_url}
    Go To    ${test_url}

Close Session
    close browser

Add Implicit Wait
    set selenium implicit wait    5

Mark Test Status
    [Arguments]    ${status}    ${reason}
    TEST STATUS    ${status}   ${reason}

Get the page title
    get title

Click on Sign In
    click element    id=signin

Enter Credentials
    [Arguments]    ${username}  ${password}
    input text    css=#username input   ${username}
    click element    css= .css-1n7v3ny-option            
    input text    css=#password input   ${password}
    click element    css= .css-1n7v3ny-option

Click on Login
    click element    id=login-btn

Verify username
    [Arguments]    ${assert_username}
    ${retrived_username}=   get text    css=.username
    run keyword if    "${retrived_username}" == "${assert_username}"    mark test status    passed    Username validated!
    run keyword if    "${retrived_username}" != "${assert_username}"    mark test status    failed    Username validation failed!
    element should contain    css=.username    ${assert_username}

Verify site content
    ${site_content}=   get text    css=body
    run keyword if    "${site_content}" == "Up and running"    mark test status    passed    Site Content validated!
    run keyword if    "${site_content}" != "Up and running"    mark test status    failed    Site Content validation failed!
    element should contain    css=body    Up and running

Add first product to cart
    click element    xpath=//*[@id="1"]/div[4]

Verify product is added to cart
    ${product_name}    get text    xpath=//*[@id="1"]/p
    ${product_incart}    get text    css=p.title    
    run keyword if    "${product_name}" == "${product_incart}"    mark test status    passed    Correct product added!
    run keyword if    "${product_name}" != "${product_incart}"    mark test status    failed    Something went wrong!        
    element should contain    css=p.title    ${product_name}
