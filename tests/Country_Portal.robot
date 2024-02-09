*** Settings ***
Resource                        ../resource/common.robot
Suite Setup                     Setup Browser
Suite Teardown                  End suite

*** Test Cases ***
Country Portal
    Run Keyword                 Login
    Switch To Lightning If Classic
    LaunchApp                   GAVI CRM
    # Run Keyword               Home
    ClickText                   Contacts
    ClickText                   TechMahindra
    ClickText                   Show more actions
    ClickText                   Log in to Experience as User

    ClickText                   Country Portal              delay=2
    TypeText                    Search Country              Somalia
    ClickText                   Somalia                     #Directly identify country, define variable
    ClickText                   NVS Application Round 4 (2023) - Somalia
    ClickText                   Measles 1st and 2nd dose routine.                       delay=2
    ClickElement                xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-switch-option[2]/div[1]/div[1]/div[2]/div[2]/form[1]/div[1]/mat-slide-toggle[1]/label[1]/div[1]
    Sleep                       3
    ClickText                   NEXT
    VerifyText                  Gavi terms and conditions                               anchor=1.2.1
    ClickText                   NEXT
    ClickText                   http://www.gavi.org/support/process/apply/
    # ClickText                 Accept ALL                  recognition_mode=vision
    VerifyText                  Gavi Guidelines
    SwitchWindow                index=1
    ClickText                   NEXT
    ScrollTo                    Date of Programme Capacity Assessment
    # ClickText                 Overall expenditures and financing for immunisation     anchor=Country health and immunisation data #Once submitted we can't edit this page again

    ClickElement                xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[3]/app-qa-combo-select-input[1]/div[1]/div[1]/div[3]/form[1]/mat-form-field[1]/div[1]/div[1]/div[1]
    ClickText                   2022                        anchor=From
    ClickElement                xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[3]/app-qa-combo-select-input[2]/div[1]/div[1]/div[3]/form[1]/mat-form-field[1]/div[1]/div[1]/div[1]
    ClickText                   2024
    ClickText                   Yes
    ClickElement                xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[4]/app-qa-combo-text-input[1]/div[1]/div[1]/form[1]/mat-form-field[1]/div[1]/div[1]/div[1]/textarea[1]
    TypeText                    National customs regulations                            Testing
    TypeText                    National Regulatory Agency                              Testing
    ClickText                   NEXT

    VerifyText                  Financial Overview of Active Vaccine Programmes
    VerifyText                  Summary of active Vaccine Programmes
    ClickText                   NEXT

    TypeText                    Coverage and equity situation analysis                  Testing
    ClickText                   NEXT

    VerifyText                  Upload country documents
    ClickText                   UPLOAD                      index=1
    ${FILE_PATH}                Set Variable                ${CURDIR}/../Documents/Test.txt
    Double click         suite                       
    Double click         Documents
    ClickText           Text.txt
    ClickText           Open                        anchor=Cancel









