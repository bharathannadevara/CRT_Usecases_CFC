*** Test Cases ***
Creating An Account
    [tags]                    Account
    Appstate                  Home
    LaunchApp                 Sales

    ClickText                 Accounts
    ClickUntil                Account Information         New

    TypeText                  Account Name                Oracle                  anchor=Parent Account
    TypeText                  Phone                       +12258443456789             anchor=Fax
    TypeText                  Fax                         +12258443456766
    TypeText                  Web Site                     https://www.oracle.com
    Picklist                  Type                        Customer - Direct
    Picklist                  Industry                    Technology

    TypeText                  Employees                   75000
    TypeText                  Annual Revenue              40 billion
    ClickText                 Save                        partial_match=False

    ClickText                 Details
    VerifyText                Oracle
    VerifyText                75,000


Create A Contact For The Account
    [tags]                    salesforce.Account
    Appstate                  Home
    LaunchApp                 Sales
    ClickText                 Accounts
    VerifyText                Oracle
    VerifyText                Contacts

    ClickUntil                Email                       Contacts
    ClickUntil                Contact Information         New
    Picklist                  Salutation                  Mr.
    TypeText                  First Name                  Shiva
    TypeText                  Last Name                   Kumar
    TypeText                  Phone                       +00150345678134             anchor=Mobile
    TypeText                  Mobile                      +00150345678178
    Combobox                  Search Accounts...          Oracle

    TypeText                  Email                       shivakumar1@gmail.com     anchor=Reports To
    TypeText                  Title                       Manager
    ClickText                 Save                        partial_match=False
    Sleep                     1
    ClickText                 Contacts
    VerifyText                Shiva Kumar


Creating An Opportunity For The Account
    [tags]                    Account
    Appstate                  Home
    LaunchApp                 Sales
    ClickText                 Accounts
    VerifyText                Oracle
    
    ClickText                 Oracle
    ClickText                 Related
    ClickText                 Opportunities               anchor=Related

    ClickText                New
    TypeText                  Opportunity Name            Internal Business            
    #Combobox                  Search Accounts...          Oracle              delay=2
    Picklist                  Type                        New Customer
    Picklist                  Lead Source                 Partner Referral
    TypeText                  Close Date                  11/11/2023
    TypeText                  Amount                      10000000
    TypeText                  Next Step                   Qualification
    PickList                  Stage                       Prospecting
    TypeText                  Description                 This is first step
    ClickText                 Save                        partial_match=False         # Do not accept partial match, i.e. "Save All"

    Sleep                     1

    ClickText                 Opportunities
    VerifyText                Oracle
