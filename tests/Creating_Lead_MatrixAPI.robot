*** Settings ***
Resource              ../resources/common.robot
Library               DataDriver    reader_class=TestDataApi    name=ui2.xlsx    #iterates through the Leads csv
Suite Setup           Setup Browser
Suite Teardown        End suite
Test Template        Entering A Lead With Data
*** Test Cases ***
Add a new lead with all required fields ${LastName} ${Company}${LeadStatus}
    [Tags]                    Lead1

*** Keywords ***
Entering A Lead With Data
    [Arguments]               ${LastName}  ${Company}  ${LeadStatus}
    [tags]                    Leads
    Run Keyword               Home
    ClickText                 Leads
    ClickText                 New
    VerifyText                Lead Information
    UseModal                  On                          # Only find fields from open modal dialog

    TypeText                  Last Name                   ${LastName}
    Picklist                  Lead Status                 ${LeadStatus}
    TypeText                  Company                     ${Company}                  
    ClickText                 Save                        partial_match=False
    UseModal                  Off
    Sleep                     1

 #Verify created lead
    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s
    verifytext                 ${LastName}

#Delete the lead to clean up data
    LaunchApp                 Sales
    ClickText                 Leads
    VerifyText                Recently Viewed             timeout=120s

    ClickText                ${LastName}
    ClickText                 Delete
    ClickText                 Delete
    
