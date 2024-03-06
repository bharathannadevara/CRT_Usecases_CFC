*** Settings ***
Library                         QForce
Library                         QWeb


*** Variables ***
# IMPORTANT: Please read the readme.txt to understand needed variables and how to handle them!!
${initial_sleep_time}           5
${BROWSER}                      chrome
${username}                     mounika.t@cloudfulcrum.com.uat
${password}                     GAVI@1234
${login_url}                    https://test.salesforce.com                             # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}                     ${login_url}/lightning/page/home


*** Keywords ***
Setup Browser
    # Setting search order is not really needed here, but given as an example
    # if you need to use multiple libraries containing keywords with duplicate names
    Set Library Search Order    QForce                      QWeb
    Open Browser                about:blank                 ${BROWSER}
    SetConfig                   DefaultTimeout              30s                         #sometimes salesforce is slow

End suite
    Close All Browsers

Login
    [Documentation]             Login to Salesforce instance
    GoTo                        ${login_url}
    TypeText                    Username                    ${username}                 delay=1
    TypeText                    Password                    ${password}
    ClickText                   Log In

Home
    [Documentation]             Navigate to homepage, login if needed
    GoTo                        ${home_url}
    ${login_status} =           IsText                      To access this page, you have to log in to Salesforce.                              2
    Log                         ${login_status}
    Run Keyword If              ${login_status}             Login
    ClickText                   Home
    VerifyTitle                 Home | Salesforce

Wait And Increase Sleep Time
    [Arguments]                 ${initial_sleep_time}
    ${sleep_time}=              Evaluate                    ${initial_sleep_time} + 30 if ${initial_sleep_time} > 5 else ${initial_sleep_time}
    Sleep                       ${sleep_time}s

Log Out
    ClickText                   View profile
    ClickText                   Log Out                     partial_match=False

Switch To Lightning If Classic
    ${is_classic} =             Is Text                     Switch to Lightning Experience                          timeout=2                   # Short timeout for quick check
    Run Keyword If              ${is_classic}               Click Text                  Switch to Lightning Experience
    
Click START NEW if visible or click SEE APPLICATION
    ${isNewVisible}=    Is Text    START NEW
    IF    ${isNewVisible}
        Click Text    START NEW            # anchor=Status        recognition_mode=vision
    ELSE
        Click Text    SEE APPLICATION(S)                         anchor=NVS Application Round 4 (2023) - ${Country}    recognition_mode=vision
    END

Pause
    Sleep                       7