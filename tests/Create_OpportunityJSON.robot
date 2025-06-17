*** Settings ***
Documentation            Example on how to use QForce REST API keywords
Library                  QForce
Library                  RequestsLibrary
Resource                 ../resources/common.resource
Suite Setup              Setup Browser
Suite Teardown           End Suite


*** Variables ***
${client_id}             
${client_secret}         
${Username}              bannadevara1@gmail.com
${Password}              Cloudywebs@007,
${login_url}             https://login.salesforce.com                            # Salesforce instance. NOTE: Should be overwritten in CRT variables


*** Test Cases ***
Read Data From JSON And Test Opportunity API
    [Tags]               JSON opportunity

    # #Authenticating with salesforce org.
    # Authenticate       ${client_id}                ${client_secret}            ${Username}              ${Password}                 sandbox=false

    # #Loading JSON file into CRT
    # ${load_JSONfile}                               Load Json From File         ${CURDIR}/opportunity.json
    # Log To Console     ${load_JSONfile}

    # #Creating single record in salesforce org.
    # ${new_oppo}=       Create Record               Opportunity                 Name=${load_JSONfile["Name"]}                        StageName=${load_JSONfile["StageName"]}    CloseDate=${load_JSONfile["CloseDate"]}
    # Log To Console     ${new_oppo}


    #Authenticating with salesforce org.
    Authenticate         ${client_id}                ${client_secret}            ${Username}              ${Password}                 sandbox=false

    #Loading JSON file into CRT
    ${load_JSONfile}=    Load Json From File         ${CURDIR}/opportunity.json
    Log To Console       ${load_JSONfile}

    FOR                  ${index}                    IN                          @{load_JSONfile}
    #Creating multiple records in salesforce org. with help of list
        ${new_oppo}=     CreateRecord                Opportunity                 Name=${index["Name"]}    StageName=${index["StageName"]}                         CloseDate=${index["CloseDate"]}
        Log              ${new_oppo}
    END
