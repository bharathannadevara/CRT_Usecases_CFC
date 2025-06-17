*** Settings ***
Resource           ../resources/common.robot
Library                   DataDriver                  reader_class=TestDataApi    name=leadcreateUI.xlsx    sheet=sheet2
Suite Setup        Setup Browser
Suite Teardown     Close All Browsers
#Test Template      Salesforce Test


*** Test Cases ***
Create Lead     
    [Tags]         createsinglelead

*** Keywords ***
Salesforce Test
    [Arguments]    ${LastName}  ${FirstName}    ${Company}    ${Status}    ${Rating}
    Run Keyword    Login                      
    LaunchApp      Sales
    ClickText      Leads
    ClickText      New
    UseModal       On
    # PickList     Salutation                  ${Salutation}
    TypeText       First Name                  ${FirstName}
    TypeText       Last Name                   ${LastName}
    TypeText       Company                     ${Company}
    PickList       Lead Status                 ${Status}
    PickList       Rating                      ${Rating}
    Clicktext      Save                        partial_match=false
    Sleep          2
    UseModal       Off
    Run Keyword    LogOut


*** Test Cases ***
Update Lead    
    [Tags]         Updatesinglelead

*** Keywords ***
Example Test
    [Arguments]    ${LastName}                 ${FirstName}    ${Company}
    Run Keyword    Home
    LaunchApp      Sales
    ClickText      Leads
    ClickText      ${FirstName}
    ClickText      Details                     Chatter
    ClickText      Edit Company
    TypeText       *Company                    ${Company}
    ClickText      Save

*** Test Cases ***
Delete Lead    
    [Tags]         Deletesinglelead

*** Keywords ***
Example Test
    [Arguments]    ${FirstName}   
    Run Keyword    Home
    LaunchApp      Sales
    ClickText      Leads
    ClickText      ${FirstName}
    ClickText      Show more actions           
    ClickText      Delete
    ClickText      Delete
