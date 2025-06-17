*** Settings ***
Resource           ../resources/common.robot
Library            DataDriver                  reader_class=TestDataApi    name=Opportunityproducts1.xlsx
Library            QForce
Library            QWeb
Suite Setup        Open Browser                about:blank                 chrome
Suite Teardown     Close All Browsers
Test Template      Add Product To Opportunity

*** Test Cases ***                          # This section will be populated by DataDriver
Reading products from excel

*** Keywords ***
Add Product To Opportunity
    [Arguments]    ${Username}                 ${Password}                 ${Name}                     ${Quantity}    ${ServiceDate}    ${Description}
    Run Keyword    Login                       ${UserName}                 ${Password}
    LaunchApp      Sales
    ClickText      Opportunities
    ClickText      New
    UseModal       On
    TypeText       Opportunity Name            Acer                        anchor=Next Step            delay= 2
    TypeText       Close Date                  12/28/2023
    PickList       Stage                       Qualification
    Clicktext      Save
    Sleep          2
    UseModal       Off
    
    ClickText      Show actions for Products
    ClickText      Add Products
    ClickText      Save
    ComboBox       Search Products...          ${Name}                     #Ciaz
    ClickText      Next
    UseTable       Item Number
    ClickCell      r1c2
    TypeText       Quantity                    ${Quantity}                 #1.00
    ClickText      Quantity
    ClickCell      r1c4
    TypeText       Date                        ${ServiceDate}              #12/29/2023
    ClickCell      r1c5
    TypeText       Line Description            ${Description}              #Screen issue
    ClickText      Save
    Run Keyword    LogOut
