*** Settings ***
Documentation       Example on how to use QForce REST API keywords
Resource            ../resources/common.resource
Library             Collections
Suite Setup         Setup Browser
Suite Teardown      End Suite


*** Test Cases ***
Verify Email Was Successfully Sent
    [Tags]          Verify_Email

    Authenticate    ${client_id}                ${client_secret}            ${username}    ${password}    sandbox=false
    ${query}=       Query Records               SELECT Id, Name, MessageDate, TextBody FROM EmailMessage ORDER BY Id DESC LIMIT 1
    Log             ${query}

    ${record}=      Set Variable                ${query['records'][0]}
    Log             Id: ${record}[Id]
    Log             Name: ${record}[Name]
    Log             MessageDate: ${record}[MessageDate]
    Log             TextBody: ${record}[TextBody]
