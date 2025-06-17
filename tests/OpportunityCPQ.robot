*** Settings ***
Documentation     Example on how to use QForce REST API keywords
Resource          ../resources/common.robot
Suite Setup       Setup Browser
Suite Teardown    End Suite


*** Test Cases ***
Create Opportunity
    [Tags]        Verify opportunity
    Appstate      Home
    LaunchApp     Sales
    ClickText     Opportunities
    ClickText     New
    UseModal      On
    TypeText      *Opportunity Name           List of products
    ClickText     *Close Date
    UseTable      Sun
    ClickCell     r5c4
    PickList      *Stage                      Value Proposition
    ClickText     Save                        partial_match=False
    UseModal      Off
    ClickText     Show actions for Products
    ClickText     Add Products
    UseModal      On
    PickList      Price Book                  Standard Price Book
    ClickText     Save
    UseModal      Off
    UseModal      On
    UseModal      Off
    Sleep         2
    #ClickText    Search Products...
    ComboBox      Search Products...          Lenovo                      partial_match=False
    Sleep         2
    ComboBox      Search Products...          Panasonic                   partial_match=False
    Sleep         2
    ComboBox      Search Products...          Ciaz                        partial_match=False
    Sleep         2
    ClickText     Next                        partial_match=False
    UseTable      Item Number
    ClickCell     r1c2
    TypeText      Quantity                    2
    ClickText     Quantity
    ClickCell     r2c2
    TypeText      Quantity                    3
    ClickText     Quantity
    ClickCell     r3c2
    TypeText      Quantity                    1
    ClickText     Quantity
    ClickText     Save
    # ClickText                               Show actions for this object
    # ClickText                               New Quote
    # UseModal    On
    # TypeText    *Quote Name                 Mobile quote
    # ClickText                               Expiration Date             anchor=Quote Number
    # UseTable    Sun
    # ClickCell                               r5c4
    # PickList    Status                      In Review
    # ClickText                               Save
    # UseModal    Off
    # ClickText                               Quotes
    # ClickText                               00000008
    # ClickText                               Show more actions           anchor=Quotegoog
    # ClickText                               Create PDF
    # UseModal    On
    # ClickText                               Save to Quote
    # UseModal    Off


    VerifyText    Quotes
    ClickText     Quotes
    ClickText     New Quote
    UseModal      On
    TypeText      *Quote Name                 Quote for opportunity
    ClickText     Save
    UseModal      Off
    ClickText     Quote for opportunity
    # VerifyText    New Case
    # Sleep         2
    ClickText     Details                     anchor=Related              partial_match=False
    ClickText     Show more actions
    ClickText     Create PDF
    UseModal      On
    Sleep         5
    VerifyText    Save to Quote
    ClickText     Save to Quote               partial_match=False
    UseModal      Off
    Sleep         2
    Run Keyword   Logout


*** Settings ***
Documentation         Example on how to use QForce REST API keywords
Resource              ../resources/common.robot
Suite Setup           Run Keyword                 Setup Browser
Library               DataDriver                  reader_class=TestDataApi    name=Products.xlsx
Test Template         Products

*** Test Cases ***
Create Products
    [Tags]            CreateProducts

*** Keywords ***
Products
    [Arguments]       ${Name}                     ${ProductCode}              ${Family}                ${IsActive}    ${UnitPrice}
    Run Keyword       Login
    Sleep             5
    ${istext}=        IsText                      Your session has ended
    Run Keyword If    ${istext}                   Login
    LaunchApp         Sales
    Sleep             2
    ClickText         Products
    VerifyText        New                        anchor=Add to Category
    ClickText         New                        anchor=Add to Category
    UseModal          On
    TypeText          Product Name*               ${Name}
    ClickCheckbox     Active                      ${IsActive}
    TypeText          Product Code                ${ProductCode}
    PickList          Product Family              ${Family}
    ClickText         Save                        partial_match=False
    UseModal          Off
    ClickText         Related
    ClickText         Add Standard Price
    UseModal          On
    TypeText          List Price                  ${UnitPrice}
    ClickText         Save                        partial_match=False
    UseModal          Off
    Sleep             3
    Run Keyword       Logout
