*** Settings ***
Resource                        ../resource/common.robot
Resource                        ../resource/Xpath_Variables.robot
Library                        DataDriver    reader_class=TestDataApi      Name=Country_Portal1  
Suite Setup                     Setup Browser
Suite Teardown                  End suite

*** Test Cases ***
Country Portal
    [Arguments]                 ${Country}    ${Customs_Regulations}    ${Regulatory_Agency}    ${Coverage_and_Equity}    ${Vaccine_Presentation}    ${First_Dose}    ${Second_Dose}    ${Co_financing_Payment1}    ${Co_financing_Payment2}     ${Live_Births}    ${Gov_Funding}    ${Other_Donors}    ${Gavi_Support}    ${Amount_Gov_Funding}    
    ...                        ${Amount_Other_Donors}    ${Amount_Gavi_Support}    ${Key_Budget}    ${Financial_Management}    ${Compliance_Gavi_Guidelines}    ${Fiduciary_Management}    ${Additional_Technical_Assistance}    ${Rationale_Request}    ${cMYP}    ${NITAG}    ${Financial_Sustainability}    ${Programmatic_Challenges}    ${Improving_Coverage_and_Equity}    ${Synergies}    ${Measles_and_Rubella_Activities}
    Run Keyword                 Login
    Switch To Lightning If Classic
    LaunchApp                   GAVI CRM
    # Run Keyword               Home
    ClickText                   Contacts
    ClickText                   TechMahindra
    ClickText                   Show more actions
    ClickText                   Log in to Experience as User

    ClickText                   Country Portal              delay=2
    TypeText                    Search Country              ${Country}
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

    ClickElement                ${NHSP_FromYear}
    ClickText                   2023                        anchor=From
    ClickElement                ${NHSP_ToYear}
    ClickText                   2024                        anchor=To
    ClickText                   Yes
    TypeText                    National customs regulations                            ${Customs_Regulations}
    TypeText                    National Regulatory Agency                              ${Regulatory_Agency}
    ClickText                   NEXT

    VerifyText                  Financial Overview of Active Vaccine Programmes
    VerifyText                  Summary of active Vaccine Programmes
    ClickText                   NEXT

    TypeText                    Coverage and equity situation analysis                  ${Coverage_and_Equity}
    ClickText                   NEXT

    # 2.4 Upload country documents
    VerifyText                  Country and planning documents
    ScrollText                  Country and planning documents
    ${FILE_PATH}                Set Variable                ${CURDIR}/../Documents
    ClickText                   UPLOAD                      anchor=1
    Double click                suite
    Double click                Documents
    Double click                Test_Gavi.txt
    Sleep                       10

    ClickText                   SELECT FROM LIBRARY         anchor=2                    #Country strategic multi-year plan / cMYP costing tool
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=3                    #Effective Vaccine Management (EVM) assessment
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause
    ClickText                   REMOVE                      anchor=6
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=4                    #Effective Vaccine Management (EVM): most recent improvement plan progress report
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause
    ClickText                   UPDATE                      anchor=7
    Double click                CRT_Demo.pdf
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=5
    UseTable                    File(s)
    ClickCell                   r5c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=6
    UseTable                    File(s)
    ClickCell                   r4c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=7
    UseTable                    File(s)
    ClickCell                   r3c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=8
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=9
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    # Coordination and advisory groups documents
    ScrollText                  Coordination and advisory groups documents
    ClickText                   UPLOAD                      anchor=National Coordination Forum Terms of Reference    delay=3
    Double click                Test_Gavi.txt
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=National Coordination Forum meeting minutes of the past 12 months
    UseTable                    File(s)
    ClickCell                   r3c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    # Other documents
    ClickText                   SELECT FROM LIBRARY         anchor=PREVIOUS             partial_match=false
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause
    ClickText                   NEXT

    # 3.1.1 Vaccine and programmatic data
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
    ClickItem                   Open calendar               anchor=Required date for vaccine and supplies to arrive
    ClickText                   FEB
    ClickText                   22
    ClickItem                   Open calendar               anchor=Planned launch date
    ClickText                   AUG
    ClickText                   22
    ClickElement                ${Support_Requested}
    ClickText                   2024
    Pause
    ScrollText                  Vaccine procurement
    TypeText                    Vaccine presentation registration or licensing          ${Vaccine_Presentation}
    ClickText                   Yes                         anchor=Vaccine procurement
    ClickText                   NEXT

    # 3.1.2 Target Information
    TypeText                    Please describe the target age cohort for the Measles 1st dose routine immunisation:    ${First_Dose}    partial_match=false
    ClickText                   months                      anchor=Please describe the target age cohort for the Measles 1st dose routine immunisation:
    VerifyText                  Please describe the target age cohort for the Measles 2nd dose routine immunisation:
    ClickElement                ${Second_Dose_Xpath}
    TypeText                    Please describe the target age cohort for the Measles 2nd dose routine immunisation:    ${Second_Dose}    partial_match=false
    ClickText                   months                      anchor=Please describe the target age cohort for the Measles 2nd dose routine immunisation:

    # UseTable                  Population in the target age cohort (#)
    # ClickElement              xpath=//tbody/tr[1]/td[2]/div[1]/button[1]/span[1]/i[1]
    # TypeText                  Population in the target age cohort (#)-2024            2375
    # ClickText                 SAVE
    # Wait                      6
    # ClickElement              xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[2]/td[2]/div[1]/button[1]/span[1]/i[1]
    # TypeText                  Target population to be vaccinated (first dose) (#)-2024                            2451
    # ClickText                 SAVE
    # Wait                      6
    # ClickElement              xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[3]/td[2]/div[1]/button[1]/span[1]/i[1]
    # TypeText                  Population in the target age cohort for last dose(#)-2024                           4568
    # ClickText                 SAVE
    # Wait                      6
    # ClickElement              xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[4]/td[2]/div[1]/button[1]/span[1]/i[1]
    # TypeText                  Target population to be vaccinated for last dose (#)-2024                           2343
    # ClickText                 SAVE
    # Wait                      6
    # ClickElement              xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[5]/td[2]/div[1]/button[1]/span[1]/i[1]
    # TypeText                  Estimated wastage rates for preferred presentation (%)-2024                         47
    # ClickText                 SAVE
    # Wait                      6
    ClickText                   NEXT

    # 3.1.3 Co-financing information
    ClickText                   Yes                         anchor=Do you accept?
    ScrollText                  Country choice of co-financing amount per vaccine dose
    ClickText                   Update Estimated Values To be Financed
    Pause
    TypeText                    Please indicate the process for ensuring that the co-financing payments are made in a timely manner.    ${Co_financing_Payment1}
    TypeText                    If your country is in the accelerated transition phase for Gavi support, please answer the following question:    ${Co_financing_Payment2}
    ClickElement                ${Co_financing_Payment_fundmonth}
    ClickText                   March
    UseModal                    off
    Sleep                       2
    ClickElement                ${Co_financing_Payment_Supportmonth}
    ClickText                   April
    Sleep                       2
    ClickElement                ${Co_financing_Payment_Supportyear}
    ClickText                   2024
    ClickText                   NEXT

    # 3.1.4 Financial support from Gavi
    TypeText                    Live births (year of introduction)                      ${Live_Births}
    ClickItem                   Open calendar
    ClickText                   22
    TypeText                    Total amount - Gov. Funding / Country Co-financing (US$)                            ${Gov_Funding}
    TypeText                    Total amount - Other donors (US$)                       ${Other_Donors}
    TypeText                    Total amount - Gavi support (US$)                       ${Gavi_Support}
    TypeText                    Amount per target person - Gov. Funding / Country Co-financing (US$)                ${Amount_Gov_Funding}
    TypeText                    Amount per target person - Other donors (US$)           ${Amount_Other_Donors}
    Typetext                    Amount per target person - Gavi support (US$)           ${Amount_Gavi_Support}
    TypeText                    Key Budget Activities       ${Key_Budget}
    TypeText                    Financial management procedures                         ${Financial_Management}
    ClickText                   Yes                         anchor=Compliance with guidelines for use of Gavi financial support for human resources (HR) costs
    TypeText                    Please provide further information and justification concerning human resources costs, particularly when issues and challenges have been raised regarding the compliance with Gavi guidelines.    ${Compliance_Gavi_Guidelines}
    TypeText                    Fiduciary management        ${Fiduciary_Management}
    TypeText                    Use of financial support to fund additional Technical Assistance needs              ${Additional_Technical_Assistance}
    ClickText                   NEXT

    # 3.1.5 Strategic considerations
    TypeText                    Rationale for this request                              ${Rationale_Request}
    TypeText                    Alignment with country strategic multi-year plan / comprehensive multi-year plan (cMYP)    ${cMYP}
    TypeText                    Coordination Forum (ICC, HSCC or equivalent) and technical advisory committee (NITAG)    ${NITAG}
    TypeText                    Financial sustainability    ${Financial_Sustainability}
    TypeText                    Programmatic challenges     ${Programmatic_Challenges}
    TypeText                    Improving coverage and equity of routine immunisation                               ${Improving_Coverage_and_Equity}
    TypeText                    Synergies                   ${Synergies}
    TypeText                    Indicative major measles and rubella activities planned for the next 5 years        ${Measles_and_Rubella_Activities}
    ClickText                   NEXT

    # 3.1.6 Report on Grant Performance Framework
    ClickText                   FILL IN GRANT PERFORMANCE FRAMEWORK
    SwitchWindow                index=1
    ClickText                   NEXT

    # 3.1.7 Upload new application documents
    VerifyText                  Application documents
    ScrollText                  Application documents
    ${FILE_PATH}                Set Variable                ${CURDIR}/../Documents
    ClickText                   UPLOAD                      anchor=1
    Double click                suite
    Double click                Documents
    Double click                Test_Gavi.txt
    Sleep                       10

    ClickText                   SELECT FROM LIBRARY         anchor=2
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=3
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause
    ClickText                   REMOVE                      anchor=Workplan with activities specific to Vaccine grant
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=3
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    VerifyText                  MoH and MoF signatures
    ClickText                   SELECT FROM LIBRARY         anchor=4
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause
    ClickText                   UPDATE                      anchor=MoH and MoF signature page
    Double click                CRT_Demo.pdf
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=5
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    VerifyText                  Endorsement by coordination and advisory groups
    ClickText                   SELECT FROM LIBRARY         anchor=6
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    VerifyText                  cMYP addendum
    ClickText                   SELECT FROM LIBRARY         anchor=cMYP addendum
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=8
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=9
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=10
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=11
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=12
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=13
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=14
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause
    ClickText                   NEXT




    # 3.2.1 Vaccine and programmatic data
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
    ClickItem                   Open calendar               anchor=Required date for vaccine and supplies to arrive
    ClickText                   FEB
    ClickText                   22
    ClickItem                   Open calendar               anchor=Planned launch date
    ClickText                   AUG
    ClickText                   22
    ClickElement                xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-presentation-date[1]/div[1]/div[1]/form[1]/div[7]/div[1]/mat-form-field[1]/div[1]/div[1]/div[1]/mat-select[1]/div[1]/div[1]
    ClickText                   2024
    Pause
    ScrollText                  Vaccine procurement
    TypeText                    Vaccine presentation registration or licensing          Test
    ClickText                   Yes                         anchor=Vaccine procurement
    ClickText                   NEXT

    # 3.2.2 Target Information
    TypeText                    From                        5
    ClickText                   weeks                       anchor=1
    TypeText                    To                          6
    ClickText                   months                      anchor=2

    # UseTable                  Population in the target age cohort (#)
    ClickElement                xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[1]/td[2]/div[1]/button[1]
    TypeText                    Population in target age cohort (#)-2024                2375
    ClickText                   SAVE
    Wait                        5
    ClickElement                xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[2]/td[2]/div[1]/button[1]
    TypeText                    Target population to be vaccinated (first dose) (#)-2024                            2451
    ClickText                   SAVE
    Wait                        5
    ClickElement                xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[3]/td[2]/div[1]/button[1]
    TypeText                    Estimated wastage rates for preferred presentation (%)-2024                         47
    ClickText                   SAVE
    Wait                        5
    ScrollText                  Targets for measles routine first dose (M1)
    ClickElement                xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[2]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[1]/td[2]/div[1]/button[1]
    TypeText                    Population in the target age cohort (#)-2024                           4568
    ClickText                   SAVE
    Wait                        5
    ClickElement                xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[2]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[2]/td[2]/div[1]/button[1]
    TypeText                    Target population to be vaccinated (first dose) (#)-2024                           2343
    ClickText                   SAVE
    Wait                        5
    ClickElement                xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[2]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[3]/td[2]/div[1]/button[1]
    TypeText                    Number of doses procured-2024                         12344
    ClickText                   SAVE
    Wait                        5
    ClickText                   NEXT

    # 3.2.3 Co-financing information
    ClickText                   Yes                         anchor=Do you accept?
    ScrollText                  Country choice of co-financing amount per vaccine dose
    ClickText                   Update Estimated Values To be Financed
    Pause
    TypeText                    Please indicate the process for ensuring that the co-financing payments are made in a timely manner.    25
    TypeText                    If your country is in the accelerated transition phase for Gavi support, please answer the following question:    23
    ClickElement                xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[5]/app-qa-combo-select-input[1]/div[1]/div[1]/div[3]/form[1]/mat-form-field[1]/div[1]/div[1]/div[1]/mat-select[1]/div[1]/div[1]
    ClickText                   March
    UseModal                    off
    Sleep                       2
    ClickElement                xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[5]/app-combo-components[1]/div[1]/div[2]/app-qa-combo-select-input[1]/div[1]/div[1]/div[3]/form[1]/mat-form-field[1]/div[1]/div[1]/div[1]/mat-select[1]/div[1]/div[1]
    ClickText                   April
    Sleep                       2
    ClickElement                xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[5]/app-combo-components[1]/div[1]/div[2]/app-qa-combo-select-input[2]/div[1]/div[1]/div[3]/form[1]/mat-form-field[1]/div[1]/div[1]/div[1]/mat-select[1]/div[1]/div[1]
    ClickText                   2024
    ClickText                   NEXT

    # 3.2.4 Financial support from Gavi
    ClickItem                   Open calendar                        anchor=Funding needed in country by
    ClickText                   22
    TypeText                    Total amount - Gov. Funding / Country Co-financing (US$)                            200000
    TypeText                    Total amount - Other donors (US$)                       65000
    TypeText                    Total amount - Gavi support (US$)                       85000
    TypeText                    Amount per target person - Gov. Funding / Country Co-financing (US$)                127622
    TypeText                    Amount per target person - Other donors (US$)           272622
    Typetext                    Amount per target person - Gavi support (US$)           342452
    TypeText                    Key Budget Activities       Testing
    TypeText                    Financial management procedures                         Testing
    ClickText                   Yes                         anchor=Compliance with guidelines for use of Gavi financial support for human resources (HR) costs
    TypeText                    Please provide further information and justification concerning human resources costs, particularly when issues and challenges have been raised regarding the compliance with Gavi guidelines.    Testing
    TypeText                    Fiduciary management        5%
    TypeText                    Use of financial support to fund additional Technical Assistance needs              Testing
    ClickText                   NEXT

    # 3.2.5 Strategic considerations
    TypeText                    Rationale for this request                              Testing
    TypeText                    Alignment with country strategic multi-year plan / comprehensive multi-year plan (cMYP)    Testing
    TypeText                    Coordination Forum (ICC, HSCC or equivalent) and technical advisory committee (NITAG)    Testing
    TypeText                    Financial sustainability    Testing
    TypeText                    Programmatic challenges     Testing
    TypeText                    Improving coverage and equity of routine immunisation                               Testing
    TypeText                    Synergies                   Testing
    TypeText                    Indicative major measles and rubella activities planned for the next 5 years        Testing
    ClickText                   NEXT

    # 3.2.6 Report on Grant Performance Framework
    ClickText                   FILL IN GRANT PERFORMANCE FRAMEWORK
    SwitchWindow                index=1
    ClickText                   NEXT

    # 3.2.7 Upload new application documents
    VerifyText                  Application documents
    ScrollText                  Application documents
    ${FILE_PATH}                Set Variable                ${CURDIR}/../Documents
    ClickText                   UPLOAD                      anchor=1
    Double click                suite
    Double click                Documents
    Double click                Test_Gavi.txt
    Sleep                       10

    ClickText                   SELECT FROM LIBRARY         anchor=2
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=MoH and MoF signatures
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause
    ClickText                   REMOVE                      anchor=Workplan with activities specific to Vaccine grant
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=MoH and MoF signatures
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Endorsement by coordination and advisory groups
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause
    ClickText                   UPDATE                      anchor=MoH and MoF signature page
    Double click                CRT_Demo.pdf
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Minutes of NITAG meeting with specific recommendations on the requested vaccine support
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Vaccine specific
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    VerifyText                  cMYP addendum
    ClickText                   SELECT FROM LIBRARY         anchor=cMYP addendum
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=EVM improvement plan    
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Cold chain equipment inventory
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=If country request any salaries,top-up/allowance
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Supplementary Immunisation Activity (SIA) technical report
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Outbreak response with root cause analysis, if available , including M&RP supported activities
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ScrollText                  Evaluations (SIA report, PCCS, outbreak root cause analysis)
    ClickText                   SELECT FROM LIBRARY         anchor=Evaluations (SIA report, PCCS, outbreak root cause analysis)
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause
    
    ClickText                   SELECT FROM LIBRARY         anchor=PREVIOUS
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause
    ClickText                   NEXT

    # 4.1 Submission Details
    ScrollText                  Contacts
    TypeText                    Name                        Test User
    TypeText                    Position                    Associate
    TypeText                    Phone Number                1234567890
    TypeText                    Email                       Testuser@gmail.com
    TypeText                    Organisation                Gavi
    ClickText                   ADD CONTACT
    Sleep                       4

    TypeText                    Please let us know if you have any comments about this application                  Testing

    VerifyText                  Signatures
    ClickText                   DOWNLOAD APPLICATION



























    # ClickText                 Update                      anchor=C.ZMB.U.22.1.1

    # ClickText                 Update                      anchor=C.ZMB.U.22.2.5
    # ClickElement              xpath=/html/body/div[3]/div[2]/div/div[1]/div/div/c-p-e-f_-l-w-c_-milestones/div/div[3]/div/div[3]/c-p-e-f_-l-w-c_-milestone-custom-datatable/div[2]/div/div/table/tbody/tr[1]/td[1]/lightning-primitive-cell-factory/span/div/lightning-primitive-cell-button/lightning-button-icon/button


    # TypeText                  Value                       ACLAIM Africa
    # ClickText                 ACLAIM Africa
    # ClickText                 Clear

    # TypeText                  Value                       AFRIVAC
    # ClickText                 AFRIVAC
    # ClickText                 Clear




