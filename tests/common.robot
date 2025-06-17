*** Settings ***
Library                   QForce
Library                   ExcelLibrary
Library                   QWeb


*** Variables ***
${Browser}                chrome
${username}               
${password}               
${client_id}            
${client_secret}        
${login_url}              https://login.salesforce.com                            # Salesforce instance. NOTE: Should be overwritten in CRT variables
${home_url}               ${login_url}/lightning/page/home


*** Keywords ***
Setup Browser
    Open Browser          about:blank                 ${BROWSER}
    SetConfig             DefaultTimeout              30s

End suite
    Close All Browsers

Login
    [Documentation]       Login to Salesforce instance
    GoTo                  ${login_url}
    TypeText              Username                    ${Username}
    TypeSecret            Password                    ${Password}
    ClickText             Log In

Home
    GoTo                  ${login_url}/lightning/page/home
    ${login_status} =     IsText                      To access this page, you have to log in to Salesforce.                2
    Run Keyword If        ${login_status}             Login
    ClickText             Home
    VerifyTitle           Home | Salesforce

Logout
    ClickText             View profile
    ClickText             Log Out
    Sleep                 2

Switch To Lightning If Classic
    ${is_classic} =             Is Text                     Switch to Lightning Experience                          timeout=2                   # Short timeout for quick check
    Run Keyword If              ${is_classic}               Click Text                  Switch to Lightning Experience

Wait And Increase Sleep Time
    [Arguments]                 ${initial_sleep_time}
    ${sleep_time}=              Evaluate                    ${initial_sleep_time} + 30 if ${initial_sleep_time} > 5 else ${initial_sleep_time}
    Sleep                       ${sleep_time}s

Check And Click Based On Text Visibility
    [Documentation]             This Custome Keyword checks if the text "START NEW" is visible and clicks based on its visibility.

    ${isNewVisible}=            Is Text                     START NEW    
    Log                         ${isNewVisible}              
    Run Keyword If              ${isNewVisible}             Click Text                  START NEW                   anchor=GUIDELINES      index=1    dist=1.0
    ...                         ELSE                        Wait and Click SEE APPLICATION(S)

Wait and Click SEE APPLICATION(S)
    [Documentation]             Waits for 2 seconds and then clicks on "SEE APPLICATION(S)".
    Click Text                  SEE APPLICATION(S)          anchor=${Round} - ${Country}                            delay=3

Pause
    Sleep                       8

