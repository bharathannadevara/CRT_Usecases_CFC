*** Settings ***
Resource                   ../resources/common.resource
Library                    DataDriver                  reader_class=TestDataApi    name=ContactCUD.xlsx
# Library                  Collections
Library                    RequestsLibrary
Suite Setup                Setup Browser
Suite Teardown             End suite
Test Template              ContactCUD


*** Test Cases ***
Contact TestCase
    [Tags]                 ContactEtoE

*** Keywords ***
ContactCUD
    [Arguments]            ${FirstName}                ${LastName}                 ${Email}                ${MobilePhone}    ${MobilePhoneEdit}
    Log                    ${LastName}, ${Email}       console=True

    Authenticate           ${client_id}                ${client_secret}            ${username}             ${password}       sandbox=False


    # #Creating a contact record
    # ${new_contact}=      Create Record               Contact                     FirstName=${FirstName}                    LastName=${LastName}
    # ...                  Email=${Email}
    # ...                  MobilePhone=${MobilePhone}
    # Log                  ${new_contact}

    #query on record
    ${results}=            Query Records               query=Select Id, LastName FROM Contact Where LastName='${LastName}'
    ${count}=              Set Variable                ${results}[totalSize]
    log                    ${count}
    ${id}=                 Set Variable                ${results}[records][0][Id]

    # #Updating Contact
    # ${Updated_contact}=                              Update Record               Contact                 ${id}             MobilePhone=${MobilePhoneEdit}
    # Log                  ${Updated_contact}
    

    #Deleting Contact
    ${Deleted_contact}=    Delete Record               Contact                     ${id}
    Revoke
