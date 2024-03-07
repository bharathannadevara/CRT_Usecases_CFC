*** Variables ***
${Gavi_Support1}            xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-switch-option[2]/div[1]/div[1]/div[2]/div[2]/form[1]/div[1]/mat-slide-toggle[1]/label[1]
${Gavi_Support2}            xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-switch-option[4]/div[1]/div[1]/div[2]/div[2]/form[1]/div[1]/mat-slide-toggle[1]/label[1]
${NHSP_FromYear_Xpath}      xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[3]/app-qa-combo-select-input[1]/div[1]/div[1]/div[3]/form[1]/mat-form-field[1]/div[1]/div[1]/div[1]
${NHSP_ToYear_Xpath}        xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[3]/app-qa-combo-select-input[2]/div[1]/div[1]/div[3]/form[1]/mat-form-field[1]/div[1]/div[1]/div[1]
${Support_Requested_Xpath}                              xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-presentation-date[1]/div[1]/div[1]/form[1]/div[7]/div[1]/mat-form-field[1]/div[1]/div[1]/div[1]/mat-select[1]/div[1]/div[1]
${Second_Dose_Xpath}        xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-qa-combo-value-type-input[2]/div[1]/div[1]/div[1]/form[1]/mat-form-field[1]/div[1]/div[1]/div[1]/input[1]
${Target_Age_Cohort_Xpath}                              xpath=//tbody/tr[1]/td[2]/div[1]/button[1]/span[1]/i[1]
${Target_Population_FirstDose_Xpath}                    xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[2]/td[2]/div[1]/button[1]/span[1]/i[1]
${Target_Age_Cohort_LastDose_Xpath}                     xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[3]/td[2]/div[1]/button[1]/span[1]/i[1]
${Target_Population_LastDose_Xpath}                     xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[4]/td[2]/div[1]/button[1]/span[1]/i[1]
${Estimated_Wastage_Rate_Xpath}                         xpath=//body[1]/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[1]/app-table[1]/div[1]/div[1]/div[1]/form[1]/table[1]/tbody[1]/tr[5]/td[2]/div[1]/button[1]/span[1]/i[1]
${Co_financing_Payment_fundmonth_Xpath}                 xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[5]/app-qa-combo-select-input[1]/div[1]/div[1]/div[3]/form[1]/mat-form-field[1]/div[1]/div[1]/div[1]/mat-select[1]/div[1]/div[1]
${Co_financing_Payment_Supportmonth_Xpath}              xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[5]/app-combo-components[1]/div[1]/div[2]/app-qa-combo-select-input[1]/div[1]/div[1]/div[3]/form[1]/mat-form-field[1]/div[1]/div[1]/div[1]/mat-select[1]/div[1]/div[1]
${Co_financing_Payment_Supportyear_Xpath}               xpath=//body/div[1]/block-ui[1]/app-layout[1]/div[1]/div[1]/div[2]/div[1]/app-dynamic-area[1]/app-dynamic-template[1]/div[1]/div[1]/mat-sidenav-container[1]/mat-sidenav-content[1]/div[1]/app-section[5]/app-combo-components[1]/div[1]/div[2]/app-qa-combo-select-input[2]/div[1]/div[1]/div[3]/form[1]/mat-form-field[1]/div[1]/div[1]/div[1]/mat-select[1]/div[1]/div[1]
${Globe_Xpath}              xpath=//i[contains(text(),'language')]











