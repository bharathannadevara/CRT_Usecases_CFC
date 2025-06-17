*** Test Cases ***
loop chatter post
    
    Appstate                  Home
    LaunchApp                 Salesforce Chatter
    ClickText                 Chatter
    ClickUntil                 Share an update...
    TypeText                  Share an update...        Hello chatter

    FOR    ${animal}    IN    cat    dog
        Log    ${animal}
        Log    2nd keyword
    END
    Log    Outside loop
