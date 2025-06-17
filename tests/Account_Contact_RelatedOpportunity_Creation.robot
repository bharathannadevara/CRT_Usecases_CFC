
*** Settings ***
Documentation             Example on how to create an Opportunity related to an Account using Salesforce REST API
Library                   QForce
Resource                  ../resources/common.resource
Suite Setup               Setup Browser
Suite Teardown            End Suite


*** Variables ***
${username}               pavani.k@cloudfulcrum.com.trndev1
${login_url}              https://test.salesforce.com/
${password}               Pavani@11
${client_id}              3MVG91Cqi3bGIrUP3fp0J9yqzg1WB37_BTcS039WUnxA_.3SPaQBuF2tt2R0ik0HIrzZVLYnISG6uGxmv2P_r
${client_secret}          A8D90FBAA2F85A8A8690B98DB72EF481CD669D6E588A83836BF3EE625CC3357B
${account_name}           Sales12

*** Test Cases ***
Create Opportunity Related To Account
    [Tags]                Opportunity2
    # Authenticate to Salesforce REST API
    Authenticate          ${client_id}                ${client_secret}            ${username}             ${password}              sandbox=True

    # Create Account 
    ${Account_record}=    Create Record    Account    Name=AccountOppo 
   # Create contact 
    ${contact_record}=    Create Record    Contact    LastName=ContactOppo    AccountId= ${Account_record}


    # Create a new opportunity record linked to the AccountId
    ${opportunity_record} =    Create Record    Opportunity    Name=TestContact1    StageName=Prospecting    CloseDate=2024-12-31  AccountId= ${Account_record}   Contact__c=${contact_record}
    # Verify that the opportunity record has been created with the correct AccountId
   ${results}=           Query Records               query=Select Name FROM opportunity Where Name='TestContact'  
    ${count}=             Set Variable                ${results}[totalSize]
    log                   ${count}
