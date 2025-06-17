*** Settings ***
Documentation                   Example on how to use QForce REST API keywords
Resource                        ../resources/common.resource
Suite Setup                     Setup Browser
Suite Teardown                  End Suite
Library                         QForce
Library                         RequestsLibrary
Library                         Collections
Library                         QWeb



*** Variables ***
${client_id}                    3MVG9wt4IL4O5wvLsQAIOmGcmrp6DtYDDoGZgZYM3uYmTw15PfmFESFp4fzwJuYmYdhM600Z0dfpb_aPbSJyJ
${client_secret}                BECC03943296ABE3787882D57E0EB87712EE370BA747BE9C0F0B466DD0C33D39
${Username}                     bannadevara1@gmail.com
${Password}                     Cloudywebs@007,


*** Test Cases ***
Create and get response from Account API's
    [Documentation]             Example test case on how to create test data using REST API
    [tags]                      REST API                    Create

    # Authenticate to Salesforce
    Authenticate                ${client_id}                ${client_secret}            ${username}                 ${password}                 sandbox=False

    # Create a new Account record
    ${my_acc}=                  Create Record               Account                     Name=Jefferies

    # Create a new session for fetching data
    Create Session              FetchData                   https://capgemini-5e7-dev-ed.lightning.force.com/

    # Get the response from the Account record
    ${response}                 Get On Session              FetchData                   lightning/r/Account/${my_acc}
    ${Actual_code} =            convert to string           ${response.status_code}
    Log                         ${my_acc}
    Log                         ${response}
    Should Be Equal As Strings                              ${response.status_code}     200

    # Get the record details
    ${response_body}            Get Record                  Account                     ${my_acc}

    # Log the response body
    Log                         Response Body: ${response_body}

    # Iterate through values and print each one
    FOR                                             ${value}                    IN                          @{response_body.items()}
        Log                      ${value}
    END
