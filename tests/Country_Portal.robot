*** Settings ***
Resource                        ../resource/common.robot
Resource                        ../resource/Xpath_Variables.robot
Library                         QVision
Library                         DataDriver                  reader_class=TestDataApi    Name=Country_Portal_Gavi.xlsx
Suite Setup                     Setup Browser
Suite Teardown                  End suite
# Test Template                   Country_Portal_Keywords

*** Test Cases ***
Country_Portal_TestCase
    [Tags]                      Country_Portal

*** Keywords ***
Country_Portal_Keywords
    [Arguments]                 ${Contact_Rec}              ${Country}                  ${Average_Exchange_Rate}    ${Total_Government_Expenditure}                         ${Total_Government_Health_Expenditure}
    ...                         ${Immunisation_Budget}      ${Domestic}                 ${GAVI}                     ${UNICEF}                   ${WHO}                      ${From_Year}
    ...                         ${To_Year}                  ${Customs_Regulations}      ${Regulatory_Agency}        ${Coverage_and_Equity}
    ...                         ${Vaccine_Presentation}     ${First_Dose}               ${Second_Dose}              ${Target_Age_Cohort}        ${Target_Population_FirstDose}
    ...                         ${Target_Age_Cohort_LastDose}                           ${Target_Population_LastDose}                           ${Estimated_Wastage_Rate}
    ...                         ${Co_financing_Payment1}    ${Co_financing_Payment2}    ${Live_Births}
    ...                         ${Gov_Funding}              ${Other_Donors}             ${Gavi_Support}             ${Amount_Gov_Funding}       ${Amount_Other_Donors}      ${Amount_Gavi_Support}     ${Key_Budget}
    ...                         ${Financial_Management}     ${Compliance_Gavi_Guidelines}                           ${Fiduciary_Management}     ${Additional_Technical_Assistance}
    ...                         ${Rationale_Request}        ${cMYP}                     ${NITAG}                    ${Financial_Sustainability}                             ${Programmatic_Challenges}
    ...                         ${Improving_Coverage_and_Equity}                        ${Synergies}                ${Measles_and_Rubella_Activities}
    ...                         ${Vaccine_Presentation1}    ${First_Dose1}              ${Second_Dose1}             ${Target_Age_Cohort1}       ${Target_Population_FirstDose1}
    ...                         ${Target_Age_Cohort_LastDose1}                          ${Target_Population_LastDose1}                          ${Estimated_Wastage_Rate1}
    ...                         ${Co_financing_Payment11}                               ${Co_financing_Payment21}                               ${Live_Births1}
    ...                         ${Gov_Funding1}             ${Other_Donors1}            ${Gavi_Support1}            ${Amount_Gov_Funding1}      ${Amount_Other_Donors1}     ${Amount_Gavi_Support1}    ${Key_Budget1}
    ...                         ${Financial_Management1}    ${Compliance_Gavi_Guidelines1}                          ${Fiduciary_Management1}    ${Additional_Technical_Assistance1}
    ...                         ${Rationale_Request1}       ${cMYP1}                    ${NITAG1}                   ${Financial_Sustainability1}                            ${Programmatic_Challenges1}
    ...                         ${Improving_Coverage_and_Equity1}                       ${Synergies1}               ${Measles_and_Rubella_Activities1}
    ...                         ${Name}                     ${Position}                 ${Phone_number}             ${Email}                    ${Organisation}             ${Comment}


    Run Keyword                 Login
    Switch To Lightning If Classic
    LaunchApp                   GAVI CRM
    ClickText                   Contacts
    ClickText                   ${Contact_Rec}              delay=3
    ClickText                   Show more actions
    ClickText                   Log in to Experience as User

    ClickText                   Country Portal              delay=2
    TypeText                    Search Country              ${Country}
    ClickText                   ${Country}
    VerifyText                  Status
    Click START NEW if visible or click SEE APPLICATION
    Sleep                       3
    LogScreenshot
    ClickElement                ${Gavi_Support1_Xpath}      delay=5
    ClickElement                ${Gavi_Support2_Xpath}      delay=5
    Sleep                       3
    LogScreenshot
    ClickText                   NEXT


    # 1.2 Gavi terms and conditions
    VerifyText                  Gavi terms and conditions                               anchor=1.2.1
    ClickText                   NEXT

    # 1.3 Gavi guidelines and other helpful downloads
    ClickText                   http://www.gavi.org/support/process/apply/
    VerifyText                  Gavi Guidelines
    Sleep                       3
    SwitchWindow                index=1
    ClickText                   NEXT

    # 2.1 Country Profile
    ClickText                   Overall expenditures and financing for immunisation
    SetConfig                   ShadowDOM                   on
    Sleep                       3
    QVision.ClickText           2023                        anchor=More
    Sleep                       3
    ${isNumberVisible}=         QWeb.Is Text             Number
    IF                          ${isNumberVisible}
        QVision.ClickText       Number                      anchor=1.1 Please indicate the average exchange rate used on expenditures
        Sleep                   2
        QVision.TypeText        Number                      ${Average_Exchange_Rate}

        QVision.ClickCell       row_text=Total government expenditure                   col_text=US$0
        QVision.WriteText       ${Total_Government_Expenditure}

        QVision.ClickCell       row_text=Total government health expenditure            col_text=US$0
        QVision.WriteText       ${Total_Government_Health_Expenditure}

        QVision.ClickCell       row_text=Immunisation budget                            col_text=US$0
        QVision.WriteText       ${Immunisation_Budget}

        QVision.ClickCell       row_text=Other capital costs                            col_text=Domestic
        QVision.WriteText       ${Domestic}

        QVision.ClickCell       row_text=Other capital costs                            col_text=GAVI
        QVision.WriteText       ${GAVI}

        QVision.ClickCell       row_text=Other capital costs                            col_text=UNICEF
        QVision.WriteText       ${UNICEF}

        QVision.ClickCell       row_text=Other capital costs                            col_text=WHO
        QVision.WriteText       ${WHO}

        QVision.ScrollTo        SUBMIT                      amount=-2                   anchor=Total expenditure for immunisation               dist=2.0
        Pause
        QVision.ClickText       SUBMIT
        QVision.ClickText       SUBMIT                      anchor=CANCEL
        SwitchWindow            index=1
    ELSE
        SwitchWindow            index=1
    END

    ClickElement                ${NHSP_FromYear_Xpath}
    ClickText                   ${From_Year}                anchor=From
    ClickElement                ${NHSP_ToYear_Xpath}
    ClickText                   ${To_Year}                  anchor=To
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
    # Double click              Suite
    # Double click              Documents
    Double click                Home                        anchor=Desktop
    Double click                execution
    Double click                Gavi                        anchor=output
    Double click                Documents
    Double click                Test_Gavi.txt
    Sleep                       10

    ClickText                   SELECT FROM LIBRARY         anchor=Country strategic multi-year plan / cMYP costing tool
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Effective Vaccine Management (EVM) assessment
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause
    ClickText                   REMOVE                      anchor=5
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Effective Vaccine Management (EVM): most recent improvement plan progress report
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
    ClickText                   UPLOAD                      anchor=National Coordination Forum Terms of Reference                               delay=3
    Double click                Test_Gavi.txt
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=National Coordination Forum meeting minutes of the past 12 months
    UseTable                    File(s)
    ClickCell                   r3c1                        delay=3
    ClickText                   SELECT                      partial_match=False         delay=3
    Pause

    # Other documents
    ScrollText                  Other documents
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
    Pause
    ClickText                   Yes                         anchor=1
    ClickText                   SELECT
    ClickText                   M, 10 doses/vial, Lyophilised
    ClickText                   APPLY
    Wait                        25
    ClickText                   Yes                         anchor=2
    ClickItem                   Open calendar               anchor=Required date for vaccine and supplies to arrive
    ClickText                   MAR
    ClickText                   22
    ClickItem                   Open calendar               anchor=Planned launch date
    ClickText                   AUG
    ClickText                   22
    ClickElement                ${Support_Requested_Xpath}
    ClickText                   2024
    Pause
    ScrollText                  Vaccine procurement
    TypeText                    Vaccine presentation registration or licensing          ${Vaccine_Presentation}
    ClickText                   Yes                         anchor=Vaccine procurement
    ClickText                   NEXT

    # 3.1.2 Target Information
    TypeText                    Please describe the target age cohort for the Measles 1st dose routine immunisation:                            ${First_Dose}               partial_match=false
    ClickText                   months                      anchor=Please describe the target age cohort for the Measles 1st dose routine immunisation:
    VerifyText                  Please describe the target age cohort for the Measles 2nd dose routine immunisation:
    ClickElement                ${Second_Dose_Xpath}
    TypeText                    ${Second_Dose_Xpath}        ${Second_Dose}              partial_match=false
    ClickText                   months                      anchor=Please describe the target age cohort for the Measles 2nd dose routine immunisation:

    UseTable                    Population in the target age cohort (#)
    ClickElement                ${Target_Age_Cohort_Xpath}
    TypeText                    Population in the target age cohort (#)-2024            ${Target_Age_Cohort}
    ClickText                   SAVE
    Pause
    ClickElement                ${Target_Population_FirstDose_Xpath}
    TypeText                    Target population to be vaccinated (first dose) (#)-2024                            ${Target_Population_FirstDose}
    ClickText                   SAVE
    Pause
    ClickElement                ${Target_Age_Cohort_LastDose_Xpath}
    TypeText                    Population in the target age cohort for last dose(#)-2024                           ${Target_Age_Cohort_LastDose}
    ClickText                   SAVE
    Pause                        
    ClickElement                ${Target_Population_LastDose_Xpath}
    TypeText                    Target population to be vaccinated for last dose (#)-2024                           ${Target_Population_LastDose}
    ClickText                   SAVE
    Pause                        
    ClickElement                ${Estimated_Wastage_Rate_Xpath}
    TypeText                    Estimated wastage rates for preferred presentation (%)-2024                         ${Estimated_Wastage_Rate}
    ClickText                   SAVE
    Pause                        
    ClickText                   NEXT

    # 3.1.3 Co-financing information
    ClickText                   Yes                         anchor=Do you accept?
    ScrollText                  Country choice of co-financing amount per vaccine dose
    ClickText                   Update Estimated Values To be Financed
    Pause
    TypeText                    Please indicate the process for ensuring that the co-financing payments are made in a timely manner.            ${Co_financing_Payment1}
    TypeText                    If your country is in the accelerated transition phase for Gavi support, please answer the following question:                              ${Co_financing_Payment2}
    ClickElement                ${Co_financing_Payment_fundmonth_Xpath}
    ClickText                   March
    Sleep                       2
    ClickElement                ${Co_financing_Payment_Supportmonth_Xpath}
    ClickText                   April                       anchor=The payment for the first year of co-financed support will be made in the month of:
    Sleep                       2
    ClickElement                ${Co_financing_Payment_Supportyear_Xpath}
    ClickText                   2024                        anchor=The payment for the first year of co-financed support will be made in the month of:
    ClickText                   NEXT

    # 3.1.4 Financial support from Gavi
    TypeText                    Live births (year of introduction)                      ${Live_Births}
    ClickItem                   Open calendar
    ClickItem                   Change to year view
    ClickText                   APR
    ClickText                   16
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
    TypeText                    Alignment with country strategic multi-year plan / comprehensive multi-year plan (cMYP)                         ${cMYP}
    TypeText                    Coordination Forum (ICC, HSCC or equivalent) and technical advisory committee (NITAG)                           ${NITAG}
    TypeText                    Financial sustainability    ${Financial_Sustainability}
    TypeText                    Programmatic challenges     ${Programmatic_Challenges}
    TypeText                    Improving coverage and equity of routine immunisation                               ${Improving_Coverage_and_Equity}
    TypeText                    Synergies                   ${Synergies}
    TypeText                    Indicative major measles and rubella activities planned for the next 5 years        ${Measles_and_Rubella_Activities}
    ClickText                   NEXT

    # 3.1.6 Report on Grant Performance Framework
    ClickText                   FILL IN GRANT PERFORMANCE FRAMEWORK
    Sleep                       3
    SwitchWindow                index=1
    ClickText                   NEXT

    # 3.1.7 Upload new application documents
    VerifyText                  MoH and MoF signatures
    ClickText                   SELECT FROM LIBRARY         anchor=MoH and MoF signature page
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause
    ClickText                   UPDATE                      anchor=MoH and MoF signature page
    Double click                suite
    Double click                Documents
    Double click                CRT_Demo.pdf
    Pause

    VerifyText                  Application documents
    ScrollText                  Application documents
    ${FILE_PATH}                Set Variable                ${CURDIR}/../Documents
    ClickText                   UPLOAD                      anchor=Budget and Planning Tool
    # Double click              suite
    # Double click              Documents
    Double click                Test_Gavi.txt
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Workplan with activities specific to Vaccine grant
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Endorsement by coordination and advisory groups
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause
    ClickText                   REMOVE                      anchor=Endorsement by coordination and advisory groups
    Pause
    ClickText                   SELECT FROM LIBRARY         anchor=Endorsement by coordination and advisory groups
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Minutes of NITAG meeting with specific recommendations on the requested vaccine support
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Vaccine specific
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Annual EPI plan
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=EVM improvement plan
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Cold chain equipment inventory
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=If country request any salaries,top-up/allowance
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Supplementary Immunisation Activity (SIA) technical report
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Outbreak response with root cause analysis, if available , including M&RP supported activities
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Evaluations (SIA report, PCCS, outbreak root cause analysis)
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ScrollText                  Evaluations (SIA report, PCCS, outbreak root cause analysis)
    ClickText                   SELECT FROM LIBRARY         anchor=PREVIOUS
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause
    ClickText                   NEXT


    # 3.2.1 Vaccine and programmatic data
    ClickText                   SELECT
    ClickText                   MR, 5 doses/vial, Lyophilised
    ClickText                   APPLY
    Pause
    ClickText                   Yes                         anchor=1
    ClickText                   SELECT
    ClickText                   MR, 10 doses/vial, Lyophilised
    ClickText                   APPLY
    Wait                        20
    ClickText                   Yes                         anchor=2
    ClickItem                   Open calendar               anchor=Required date for vaccine and supplies to arrive
    ClickText                   MAR
    ClickText                   22
    ClickItem                   Open calendar               anchor=Planned launch date
    ClickText                   AUG
    ClickText                   22
    ClickElement                ${Support_Requested_Xpath}
    ClickText                   2024
    Pause
    ScrollText                  Vaccine procurement
    TypeText                    Vaccine presentation registration or licensing          ${Vaccine_Presentation1}
    ClickText                   Yes                         anchor=Vaccine procurement
    ClickText                   NEXT

    # 3.2.2 Target Information
    TypeText                    Please describe the target age cohort for the MR 1st dose routine immunisation:     ${First_Dose1}              partial_match=false
    ClickText                   months                      anchor=Please describe the target age cohort for the MR 1st dose routine immunisation:
    VerifyText                  Please describe the target age cohort for the MR 2nd dose routine immunisation:
    ClickElement                ${Second_Dose_Xpath}
    TypeText                    ${Second_Dose_Xpath}        ${Second_Dose1}             anchor=2                    recognition_mode=vision
    ClickText                   months                      anchor=Please describe the target age cohort for the MR 2nd dose routine immunisation:

    UseTable                    Population in the target age cohort (#)
    ClickElement                ${Target_Age_Cohort_Xpath}
    TypeText                    Population in the target age cohort (#)-2024            ${Target_Age_Cohort1}
    ClickText                   SAVE
    Pause                        
    ClickElement                ${Target_Population_FirstDose_Xpath}
    TypeText                    Target population to be vaccinated (first dose) (#)-2024                            ${Target_Population_FirstDose1}
    ClickText                   SAVE
    Pause                        
    ClickElement                ${Target_Age_Cohort_LastDose_Xpath}
    TypeText                    Population in the target age cohort for last dose(#)-2024                           ${Target_Age_Cohort_LastDose1}
    ClickText                   SAVE
    Pause                        
    ClickElement                ${Target_Population_LastDose_Xpath}
    TypeText                    Target population to be vaccinated for last dose (#)-2024                           ${Target_Population_LastDose1}
    ClickText                   SAVE
    Pause                        
    ClickElement                ${Estimated_Wastage_Rate_Xpath}
    TypeText                    Estimated wastage rates for preferred presentation (%)-2024                         ${Estimated_Wastage_Rate1}
    ClickText                   SAVE
    Pause                        
    ClickText                   NEXT

    # 3.2.3 Co-financing information
    ClickText                   Yes                         anchor=Do you accept?
    ScrollText                  Country choice of co-financing amount per vaccine dose
    ClickText                   Update Estimated Values To be Financed
    Pause
    TypeText                    Please indicate the process for ensuring that the co-financing payments are made in a timely manner.            ${Co_financing_Payment11}
    TypeText                    If your country is in the accelerated transition phase for Gavi support, please answer the following question:                              ${Co_financing_Payment21}
    ClickElement                ${Co_financing_Payment_fundmonth_Xpath}
    ClickText                   March
    Sleep                       2
    ClickElement                ${Co_financing_Payment_Supportmonth_Xpath}
    ClickText                   April
    Sleep                       2
    ClickElement                ${Co_financing_Payment_Supportyear_Xpath}
    ClickText                   2024
    ClickText                   NEXT

    # 3.2.4 Financial support from Gavi
    TypeText                    Live births (year of introduction)                      ${Live_Births1}
    ClickItem                   Open calendar               anchor=Funding needed in country by
    ClickText                   22
    TypeText                    Total amount - Gov. Funding / Country Co-financing (US$)                            ${Gov_Funding1}
    TypeText                    Total amount - Other donors (US$)                       ${Other_Donors1}
    TypeText                    Total amount - Gavi support (US$)                       ${Gavi_Support1}
    TypeText                    Amount per target person - Gov. Funding / Country Co-financing (US$)                ${Amount_Gov_Funding1}
    TypeText                    Amount per target person - Other donors (US$)           ${Amount_Other_Donors1}
    Typetext                    Amount per target person - Gavi support (US$)           ${Amount_Gavi_Support1}
    TypeText                    Key Budget Activities       ${Key_Budget1}
    TypeText                    Financial management procedures                         ${Financial_Management1}
    ClickText                   Yes                         anchor=Compliance with guidelines for use of Gavi financial support for human resources (HR) costs
    TypeText                    Please provide further information and justification concerning human resources costs, particularly when issues and challenges have been raised regarding the compliance with Gavi guidelines.    ${Compliance_Gavi_Guidelines1}
    TypeText                    Fiduciary management        ${Fiduciary_Management1}
    TypeText                    Use of financial support to fund additional Technical Assistance needs              ${Additional_Technical_Assistance1}
    ClickText                   NEXT

    # 3.2.5 Strategic considerations
    TypeText                    Rationale for this request                              ${Rationale_Request1}
    TypeText                    Alignment with country strategic multi-year plan / comprehensive multi-year plan (cMYP)                         ${cMYP1}
    TypeText                    Coordination Forum (ICC, HSCC or equivalent) and technical advisory committee (NITAG)                           ${NITAG1}
    TypeText                    Financial sustainability    ${Financial_Sustainability1}
    TypeText                    Programmatic challenges     ${Programmatic_Challenges1}
    TypeText                    Improving coverage and equity of routine immunisation                               ${Improving_Coverage_and_Equity1}
    TypeText                    Synergies                   ${Synergies1}
    TypeText                    Indicative major measles and rubella activities planned for the next 5 years        ${Measles_and_Rubella_Activities1}
    ClickText                   NEXT

    # 3.2.6 Report on Grant Performance Framework
    ClickText                   FILL IN GRANT PERFORMANCE FRAMEWORK
    Sleep                       3
    SwitchWindow                index=1
    ClickText                   NEXT

    # 3.2.7 Upload new application documents
    VerifyText                  MoH and MoF signatures
    ClickText                   SELECT FROM LIBRARY         anchor=MoH and MoF signature page
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause
    ClickText                   UPDATE                      anchor=MoH and MoF signature page
    Double click                CRT_Demo.pdf
    Pause

    VerifyText                  Application documents
    ScrollText                  Application documents
    ${FILE_PATH}                Set Variable                ${CURDIR}/../Documents
    ClickText                   UPLOAD                      anchor=Budget and Planning Tool
    Double click                suite
    Double click                Documents
    Double click                Test_Gavi.txt
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Workplan with activities specific to Vaccine grant
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Endorsement by coordination and advisory groups
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause
    ClickText                   REMOVE                      anchor=Endorsement by coordination and advisory groups
    Pause
    ClickText                   SELECT FROM LIBRARY         anchor=Endorsement by coordination and advisory groups
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Minutes of NITAG meeting with specific recommendations on the requested vaccine support
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Vaccine specific
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Annual EPI plan
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=EVM improvement plan
    UseTable                    File(s)
    ClickCell                   r2c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Cold chain equipment inventory
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=If country request any salaries,top-up/allowance
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Supplementary Immunisation Activity (SIA) technical report
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Outbreak response with root cause analysis, if available , including M&RP supported activities
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ClickText                   SELECT FROM LIBRARY         anchor=Evaluations (SIA report, PCCS, outbreak root cause analysis)
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause

    ScrollText                  Evaluations (SIA report, PCCS, outbreak root cause analysis)
    ClickText                   SELECT FROM LIBRARY         anchor=PREVIOUS
    UseTable                    File(s)
    ClickCell                   r1c1                        delay=4
    ClickText                   SELECT                      partial_match=False         delay=4
    Pause
    ClickText                   NEXT

    # 4.1 Submission Details
    ScrollText                  Contacts
    TypeText                    Name                        ${Name}
    TypeText                    Position                    ${Position}
    TypeText                    Phone Number                ${Phone_number}
    TypeText                    Email                       ${Email}
    TypeText                    Organisation                ${Organisation}
    ClickText                   ADD CONTACT
    Sleep                       4

    TypeText                    Please let us know if you have any comments about this application                  ${Comment}

    VerifyText                  Signatures
    ClickText                   ATTACH                      anchor=Attach the signature page(s) back.
    Double click                CRT_Demo.pdf
    ClickText                   DOWNLOAD APPLICATION        #Download application and PDF steps

    VerifyText                  Signatures
    ClickText                   ATTACH                      anchor=Attach the signature page(s) back.
    Double click                CRT_Demo.pdf
    ClickText                   SUBMIT                      anchor=PREVIOUS
    ClickText                   DOWNLOAD A COPY

    ClickElement                ${Globe_Xpath}
    ClickText                   Français
    ClickText                   TÉLÉCHARGER UNE COPIE

    ClickElement                ${Globe_Xpath}
    ClickText                   Español
    ClickText                   DESCARGAR UNA COPIA

    ClickElement                ${Globe_Xpath}
    ClickText                   Pyccknñ
    ClickText                   ЗАГРУЗИТЬ ЭКЗЕМПЛЯР









