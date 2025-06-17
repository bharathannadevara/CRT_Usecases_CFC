*** Settings ***
Documentation          Example on how to use QForce REST API keywords
Resource               ../resources/common.resource
Suite Setup            Setup Browser
Suite Teardown         End Suite


*** Test Cases ***
Create and Update Lead via REST API
    [Documentation]    Example test case on how to create test data using REST API
    [tags]             REST API Create

    Authenticate       ${client_id}                ${client_secret}            ${username}          ${password}     sandbox=True


    ${my_Lead}=        Create Record               Lead                        FirstName=Sharooq    LastName=Ali    Status=Contacted    Company=cloudfulcrum

    # Query Lead by name
    ${result}=         QueryRecords                SELECT id from Lead WHERE Name LIKE 'Sharooq Ali'

    # ${lead_id}=      Set Variable                ${lead['Id']}
    Update Record      Lead                        ${my_Lead}                  Status=Qualified
