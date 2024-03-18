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
${Round}                        NVS Application Round 1 (2024)

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
    QWeb.TypeText               Username                    ${username}                 delay=1
    QWeb.TypeText               Password                    ${password}
    QWeb.ClickText              Log In

Home
    [Documentation]             Navigate to homepage, login if needed
    GoTo                        ${home_url}
    ${login_status} =           QWeb.IsText                 To access this page, you have to log in to Salesforce.                              2
    Log                         ${login_status}
    Run Keyword If              ${login_status}             Login
    QWeb.ClickText              Home
    VerifyTitle                 Home | Salesforce

Wait And Increase Sleep Time
    [Arguments]                 ${initial_sleep_time}
    ${sleep_time}=              Evaluate                    ${initial_sleep_time} + 30 if ${initial_sleep_time} > 5 else ${initial_sleep_time}
    Sleep                       ${sleep_time}s

Log Out
    QWeb.ClickText              View profile
    QWeb.ClickText              Log Out                     partial_match=False

Switch To Lightning If Classic
    ${is_classic} =             QWeb.IsText                 Switch to Lightning Experience                          timeout=2                   # Short timeout for quick check
    Run Keyword If              ${is_classic}               QWeb.Click Text             Switch to Lightning Experience

Check And Click Based On Text Visibility
    [Documentation]             This Custome Keyword checks if the text "START NEW" is visible and clicks based on its visibility.

    ${isNewVisible}=            Run Keyword And Return Status                           Is Text                     START NEW                   anchor=GUIDELINES      index=1    dist=1.0
    Run Keyword If              ${isNewVisible}             Click Text                  START NEW                   anchor=GUIDELINES      index=1    dist=1.0
    ...                         ELSE                        Wait and Click SEE APPLICATION(S)

Wait and Click SEE APPLICATION(S)
    [Documentation]             Waits for 2 seconds and then clicks on "SEE APPLICATION(S)".
    Click Text                  SEE APPLICATION(S)          anchor=${Round} - ${Country}                            delay=3

Pause
    Sleep                       8