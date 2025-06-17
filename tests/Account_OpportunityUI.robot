# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource           ../resources/common.robot
Suite Setup        Setup Browser
Suite Teardown     End suite


*** Test Cases ***
Creating An Account and Opportunity
    [tags]         Account
    Appstate       Home
    ClickText      App Launcher
    LaunchApp      Sales
    ClickText      Accounts
    ClickText      New
    UseModal       On
    TypeText       *Account Name               Trinet ie
    PickList       Rating                      Warm
    PickList       Type                        Prospect
    PickList       Industry                    Technology
    ClickText      Save                        partial_match=False
    UseModal       Off
    ClickText      Related
    ClickText      Opportunities(0)            anchor=Related              partial_match=False
    ClickText      New                         anchor=Opportunities(0)
    UseModal       On
    TypeText       *Opportunity Name           Cloud ie
    ClickText      *Close Date
    UseTable       Sun
    ClickCell      r5c5
    PickList       *Stage                      Prospecting
    PickList       Type                        Existing Customer - Upgrade
    PickList       Lead Source                 Other
    ClickText      Save                        partial_match=False
    UseModal       Off
    ClickText      Cloud ie
    ClickText      Details                     partial_match=False
    
    #verify All     Opportunity Name,Type,Stage,Lead Source,Close Date  anchor=Expected Revenue
    Verify Text    Opportunity Name            
    Verify Text    Type                        
    Verify Text    Stage
    Verify Text    Lead Source
    Verify Text    Close Date                  anchor=Expected Revenue                
    Verify Text    Amount                      anchor=Expected Revenue
    Verify Text    Days to close
    Verify Text    Next Step
    Verify Text    Stage
    Verify Text    Order Number


