*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}          Chrome
${URL}              https://www.pinterest.com/

# Login Elements
${LOGIN_BUTTON}     //*[@id="__PWS_ROOT__"]/div/div/div[1]/div/div[1]/div/div[2]/div[2]/button
${EMAIL_FIELD}      //input[@id='email']
${PASSWORD_FIELD}   //input[@id='password']
${SUBMIT_BUTTON}    //button[@type='submit']

# Home Page Verification
${HOME_INDICATOR}   //div[contains(@data-test-id, 'homefeed')]  # Or any other home page indicator

*** Test Cases ***
Open Pinterest and Click Login
    [Documentation]  Opens Pinterest and clicks the login button.
    Open Pinterest
    Click Element    ${LOGIN_BUTTON}
    Capture Page Screenshot

Login to Pinterest
    [Documentation]  Logs into Pinterest and verifies successful login by checking home page.
    Open Pinterest
    Click Element    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${EMAIL_FIELD}    timeout=10s
    Input Text    ${EMAIL_FIELD}    wahwah.win.pkg@gmail.com
    Input Text    ${PASSWORD_FIELD}    wahwahwin.pkg
    Click Element    ${SUBMIT_BUTTON}
    
    # Verify login success by checking a known home page element
    Wait Until Element Is Visible    ${HOME_INDICATOR}    timeout=10s
    Capture Page Screenshot
    Close Browser

*** Keywords ***
Open Pinterest
    [Documentation]  Opens Pinterest in Chrome and maximizes the window.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
