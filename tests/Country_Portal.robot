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
    VerifyText                  Gavi Guidelines
    Sleep                       3
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

    # 2.4 Upload country documents
    VerifyText                  Upload country documents
    ${FILE_PATH}                Set Variable                ${CURDIR}/../Documents
    ClickText                   UPLOAD                      anchor=1
    Double click                suite
    Double click                Documents
    Double click                Test_Gavi.txt
    Sleep                       6

    ClickText                   SELECT FROM LIBRARY         anchor=Country strategic multi-year plan / cMYP costing tool
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=2
    ClickText                   SELECT                      partial_match=False         delay=2
    Sleep                       6

    ClickText                   SELECT FROM LIBRARY         anchor=Effective Vaccine Management (EVM) assessment
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=2
    ClickText                   SELECT                      partial_match=False         delay=2
    Sleep                       6
    ClickText                   REMOVE                      anchor=6
    Sleep                       6

    ClickText                   SELECT FROM LIBRARY         anchor=Effective Vaccine Management (EVM): most recent improvement plan progress report
    UseTable                    File(s)
    ClickCell                   r2c1
    ClickText                   SELECT                      partial_match=False         delay=2
    Sleep                       6
    ClickText                   UPDATE                      anchor=7
    Double click                CRT_Demo.pdf
    Sleep                       6

    # Coordination and advisory groups documents
    ScrollText                  Coordination and advisory groups documents
    ClickText                   UPLOAD                      anchor=National Coordination Forum Terms of Reference
    Double click                Test_Gavi.txt
    Sleep                       6

    ClickText                   SELECT FROM LIBRARY         anchor=National Coordination Forum meeting minutes of the past 12 months
    UseTable                    File(s)
    ClickCell                   r3c1
    ClickText                   SELECT                      partial_match=False         delay=2
    Sleep                       6

    # Other documents
    ClickText                   SELECT FROM LIBRARY         anchor=PREVIOUS             partial_match=false
    UseTable                    File(s)
    ClickCell                   r1c1
    ClickText                   SELECT                      partial_match=False         delay=2
    Sleep                       6
    ClickText                   NEXT

    # 3.1 Vaccine and programmatic data
    ClickText                   SELECT
    ClickText                   M, 5 doses/vial, Lyophilised
    ClickText                   APPLY
    Wait                        5
    ClickText                   Yes                         anchor=1
    ClickText                   SELECT
    ClickText                   M, 10 doses/vial, Lyophilised
    ClickText                   APPLY
    Wait                        5
    ClickText                   Yes                         anchor=2
    TypeText                    Required date for vaccine and supplies to arrive        17 MAR 2024
    TypeText                    Planned launch date         17 AUG 2024
    ClickElement                xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-presentation-date[1]/div[1]/div[1]/form[1]/div[7]/div[1]/mat-form-field[1]/div[1]/div[1]/div[1]/mat-select[1]/div[1]/div[1]
    ClickText                   2025
    Wait                        6
    TypeText                    Vaccine presentation registration or licensing          Test
    ClickText                   Yes                         anchor=Vaccine procurement
    ClickText                   NEXT

    # 3.2 Target Information
    TypeText                    Please describe the target age cohort for the Measles 1st dose routine immunisation:    6
    ClickText                   weeks                       anchor=Please describe the target age cohort for the Measles 1st dose routine immunisation:
    TypeText                    Please describe the target age cohort for the Measles 2nd dose routine immunisation:    6
    ClickText                   weeks                       anchor=Please describe the target age cohort for the Measles 2nd dose routine immunisation:
    UseTable                    Population in the target age cohort (#)
    ClickTableCell              
    ClickCell                   r1c2
    TypeText                    //*[@id\='mat-input-2']     1008
    ClickText                   SAVE
    ClickCell                   r1c3
    TypeText                    //*[@id\='mat-input-3']     1241
    ClickText                   SAVE
    TypeText                    Please describe the target age cohort for the Measles 1st dose routine immunisation:    6    Partial_match=False
    # ClickText                 weeks                       anchor=1
    TypeText                    Please describe the target age cohort for the Measles 2nd dose routine immunisation:    6    Partial_match=False
    # ClickText                 weeks                       anchor=2




















    # ClickText                 Update                      anchor=C.ZMB.U.22.1.1

    # ClickText                 Update                      anchor=C.ZMB.U.22.2.5
    # ClickElement              xpath=/html/body/div[3]/div[2]/div/div[1]/div/div/c-p-e-f_-l-w-c_-milestones/div/div[3]/div/div[3]/c-p-e-f_-l-w-c_-milestone-custom-datatable/div[2]/div/div/table/tbody/tr[1]/td[1]/lightning-primitive-cell-factory/span/div/lightning-primitive-cell-button/lightning-button-icon/button


    # TypeText                  Value                       ACLAIM Africa
    # ClickText                 ACLAIM Africa
    # ClickText                 Clear

    # TypeText                  Value                       AFRIVAC
    # ClickText                 AFRIVAC
    # ClickText                 Clear




