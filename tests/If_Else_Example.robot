*** Test Cases ***

If/Else example
    OpenBrowser              https://www.google.com                chrome
    
    IF    ${count} == 0
        Log    There were no links on the page
    ELSE IF    ${count} < 5
        Log    There were less than five links on the page
    ELSE
        Log   There were 5+ links on the page
    END
