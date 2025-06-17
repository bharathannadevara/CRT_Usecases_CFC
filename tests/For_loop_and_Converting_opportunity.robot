# for loop to post 5 times in chatter
    #                  Appstate                    Home
    #                  LaunchApp                   Salesforce Chatter
    #                  ClickText                   Chatter      partial_match=false

    #                  FOR                         ${Update}    IN                          Update1         Update2    Update3    Update4    Update5
    #                  ClickText                   Share an update...
    #                  TypeText                    Share an update...                       ${Update}
    #                  ClickText                   Share
    #                  ClickText                   Share an update...
    #                  END


# Converting A Lead To Opportunity-Account-Contact
    #                  [tags]                      Lead
    #                  Appstate                    Home
    #                  LaunchApp                   Sales

    #                  ClickText                   Leads
    #                  ClickText                   Tina Smith

    #                  ClickUntil                  Convert Lead                             Convert
    #                  ClickText                   Opportunity                              2
    #                  TypeText                    Opportunity Name                         Growmore Pace
    #                  ClickText                   Convert      2
    #                  VerifyText                  Your lead has been converted             timeout=30

    #                  ClickText                   Go to Leads
    #                  ClickText                   Opportunities
    #                  VerifyText                  Growmore Pace
    #                  ClickText                   Accounts
    #                  VerifyText                  Growmore
    #                  ClickText                   Contacts
    #                  VerifyText                  Tina Smith
