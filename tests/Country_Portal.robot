*** Settings ***
Resource                        ../resource/common.robot
Library                         QWeb
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
    # ClickElement              xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-switch-option[2]/div[1]/div[1]/div[2]/div[2]/form[1]/div[1]/mat-slide-toggle[1]/label[1]/div[1]
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
    ClickText                   2023                        anchor=From
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
    ${FILE_PATH}                Set Variable                ${CURDIR}/../Documents
    ClickText                   UPLOAD                      index=1
    Double click                suite
    Double click                Documents
    Double click                Test_Gavi.txt
    # ClickText                 Open                        anchor=Cancel


    ClickText                   SELECT FROM LIBRARY         anchor=Country strategic multi-year plan / cMYP costing tool
    UseTable                    File(s)
    ClickCell                   r1c1
    ClickText                   SELECT                      partial_match=False       delay=2
    Sleep                       5
    ClickText                   REMOVE                      anchor=4
    
    

















    # ClickText                 Update                      anchor=C.ZMB.U.22.1.1


    # ClickText                 Update                      anchor=C.ZMB.U.22.2.5
    # ClickElement              xpath=/html/body/div[3]/div[2]/div/div[1]/div/div/c-p-e-f_-l-w-c_-milestones/div/div[3]/div/div[3]/c-p-e-f_-l-w-c_-milestone-custom-datatable/div[2]/div/div/table/tbody/tr[1]/td[1]/lightning-primitive-cell-factory/span/div/lightning-primitive-cell-button/lightning-button-icon/button




    # TypeText                  Value                       ACLAIM Africa
    # ClickText                 ACLAIM Africa
    # ClickText                 Clear

    # TypeText                  Value                       AFRIVAC
    # ClickText                 AFRIVAC
    # ClickText                 Clear




