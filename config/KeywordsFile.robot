*** Settings ***
Library    SeleniumLibrary
Library    mark-test-status.py
Library    manage-local-testing.py

*** Variables ***
${USERNAME}=     %{BROWSERSTACK_USERNAME}
${ACCESSKEY}=    %{BROWSERSTACK_ACCESS_KEY}
${REMOTE_URL}=  https://${USERNAME}:${ACCESSKEY}@hub.browserstack.com/wd/hub

*** Keywords ***
Open Session
    [Arguments]    ${capabilities}  ${website_url}
    open browser    remote_url=${REMOTE_URL}     desired_capabilities=${capabilities}   url=${website_url}

Close Session
    close browser

Add Implicit Wait
    set selenium implicit wait    5

Mark Test Status
    [Arguments]    ${status}    ${reason}
    TEST STATUS    ${status}   ${reason}

Setup for local test
    START LOCAL
    Open Session    ${LOCAL_CAPS}     ${WEBSITE_URL}

Teardown for local test
    Close Session
    STOP LOCAL

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
    