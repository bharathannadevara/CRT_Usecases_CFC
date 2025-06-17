*** Settings ***
Resource            ../resources/common.robot
Library             DataDriver                  reader_class=TestDataApi    name=OpportunityJSON.json
Suite Setup         Run Keywords                Setup Browser
Suite Teardown      Close All Browsers
Test Template       Create Lead

*** Variables ***
${client_id}         client_id
${client_secret}     client_secret
${Username}         
${Password}          

*** Test Cases ***
Create Lead With    ${Username}     ${Password}     ${Last_Name}      ${First_Name}      ${Salutation}      ${Company}      ${Status}
    [Tags]          Lead

*** Keywords ***
Create Lead
    [Tags]          Lead
    [Arguments]     ${Last_Name}                ${First_Name}               ${Salutation}               ${Company}      ${Status}
    Authenticate    ${client_id}                ${client_secret}            ${Username}                 ${Password}     sandbox=false
    ${new_lead}=    Create Record               Lead                        LastName=${Last_Name}
    ...             FirstName=${First_Name}
    ...             Salutation=${Salutation}
    ...             Company=${Company}
    ...             Status=${Status}


*** Test Cases ***
Modifying a Lead 
    [Tags]          LeadModify

*** Keywords ***
Modify Lead
    [Tags]          LeadModify
    [Arguments]     ${Last_Name}                ${First_Name}          ${Title}
    Authenticate    ${client_id}                ${client_secret}            ${Username}                 ${Password}     sandbox=false

    # Query Lead by name
    ${results}=     QueryRecords                SELECT id from Lead WHERE Name LIKE '${First_Name} ${Last_Name}'
    # check count of found records
    ${count}=       Set Variable                ${results}[totalSize]
    # mark test case skipped if Lead is not found
    Skip If         ${count} == 0               ${First_Name} ${Last_Name} could not be found!
    ${id}=          Set Variable                ${results}[records][0][Id]
    # updating two new fields, Phone and Lead status
    UpdateRecord    Lead                        ${id}                       Title=${Title}

    # not necessary, but just getting all info from updated lead to logs
    ${my_lead}=     Get Record                  Lead                        ${id}


*** Test Cases ***
Deleting lead     
    [Tags]          Deletelead

*** Keywords ***
Delete Lead
    [Arguments]     ${Last_Name}                ${First_Name}               ${Status}
    # --------------------------NOTE--------------------------------------------------------
    # Authentication needs to be done once prior to using other REST API keywords
    # For authentication a client_id and client secret from a Connected oauth app are needed
    # in addition to test user's credentials
    # --------------------------------------------------------------------------------------
    Authenticate    ${client_id}                ${client_secret}            ${username}        ${password}    sandbox=False

    # --------------------------NOTE--------------------------------------------------------
    # For creating data, just use keyword "Create Record" with data type you want to
    # create + fields and values
    # --------------------------------------------------------------------------------------
    # To see what data is available for object (Lead), get one known id and check
    # the returned data
    #${my_lead}=    Get Record                  Lead                        00Q5E000008uv5kUAA
    # Log           ${my_lead}

    ${results}=     QueryRecords                SELECT id from Lead WHERE Name LIKE '${First_Name} ${Last_Name}'
    ${count}=       Set Variable                ${results}[totalSize]
    Skip If         ${count} == 0               ${First_Name} ${Last_Name} was already deleted!

    # get id
    ${id}=          Set Variable                ${results}[records][0][Id]
    # updating two new fields, Phone and Lead status
    DeleteRecord                            Lead                        ${id}        
