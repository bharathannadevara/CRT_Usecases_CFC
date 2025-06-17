*** Settings ***
Resource           ../resources/common.robot
Library            QForce
Library            DataDriver                  reader_class=TestDataApi    name=leadcreateUI.xlsx    sheet=sheet2
Suite Setup        Run Keywords                Setup Browser
Suite Teardown     Close All Browsers
Test Template      Example Test

*** Test Cases ***
Create Lead     
    [Tags]         CreateLead

*** Keywords ***
Example Test
    [Arguments]    ${Username}                 ${Password}                 ${LastName}               ${FirstName}    ${Company}    ${Status}    ${Rating}
    Run Keyword    Login                       ${UserName}                 ${Password}
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
    Clicktext      Save
    Sleep          2
    UseModal       Off
    Run Keyword    LogOut



*** Settings ***
Resource            ../resources/common.robot
Library             QForce
Library             DataDriver                  reader_class=TestDataApi    name=leadupdateUI.xlsx    sheet=sheet3
Suite Setup         Run Keywords                Setup Browser
Suite Teardown      Close All Browsers
Test Template       Update Lead Record

*** Test Cases ***
Modifying a lead     
    [Tags]          UpdateLead

*** Keywords ***
Update Lead Record
    [Arguments]     ${FirstName}                ${LastName}                 ${Company}                ${Title}
    # Authenticate    ${client_id}                ${client_secret}            ${username}               ${password}
    Run Keyword     Login                       ${username}                 ${password}
    Launch App      Sales
    Click Text      Leads

    # Query Lead by name
    ${results}=     QueryRecords                SELECT id from Lead WHERE Name LIKE '${FirstName} ${LastName}'
    
    # Getting record Id from query
    ${id}=          Set Variable                ${results}[records][0][Id]

    # updating two new fields, Title and Company
    UpdateRecord    Lead                        ${id}                       Title=${Title}            Company=${Company}
    VerifyRecord    Lead                        ${id}                       Title=${Title}            Company=${Company}


    # # not necessary, but just getting all info from updated lead to logs
    # ${my_lead}=     Get Record                  Lead                        ${id}
    # log             ${my_lead}



*** Settings ***
Resource            ../resources/common.robot
Library             DataDriver                  reader_class=TestDataApi    name=leaddeleteUI.xlsx    sheet=sheet4
Suite Setup         Run Keywords                Setup Browser
Suite Teardown      Close All Browsers
Test Template       Delete Lead Record

*** Test Cases ***
Deleting a lead     
    [Tags]          DeleteLeadUI

*** Keywords ***
Delete Lead Record
    [Arguments]     ${FirstName}                ${LastName}
    Authenticate    ${client_id}                ${client_secret}            ${username}               ${password}

    Run Keyword     Login                       ${username}                 ${password}
    Launch App      Sales
    Click Text      Leads

    # Query Lead by unique fields
    ${results}=     QueryRecords                SELECT id from Lead WHERE Name LIKE '${FirstName} ${LastName}'
    
    # Getting record Id from query
    ${id}=          Set Variable                ${results}[records][0][Id]

    # Deleting a field
    DeleteRecord    Lead                        ${id}

    Run Keyword     LogOut
    Revoke



# # check count of found records
#     ${count}=       Set Variable                ${results}[totalSize]

#     # mark test case skipped if Lead is not found
#     Skip If         ${count} == 0               ${FirstName} ${LastName} could not be found!
