# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource             ../resources/common.robot
Library              QVision
# Library            QWeb
Library              RequestsLibrary
Library              Collections
Library              SeleniumLibrary
Suite Setup          Setup Browser
Suite Teardown       End suite



*** Test Cases ***
Retrieve Authentication Code And Login
    # Open the Outlook mail login page and log in to the mailbox
    Open Browser     https://outlook.office.com                              chrome
    Type Text        Email, phone, or Skype      ${username}
    Click Text       Next
    Type Secret      Enter password              ${password}
    Click Text       Sign in
    Click Text       Yes

    # Wait for the inbox to load and open the email containing the authentication code
    Verify Text      Inbox
    TypeText         Search                      MFA Code
    Click Text       MFA Code

    ${email_text}    Get Text                    Your code is:

    # Retrieve the authentication code from the email
    ${auth_text}     Evaluate                    $email_text.split(":")
    ${auth_code}     Evaluate                    $auth_text[1].strip()
    #${auth_code} =                              GetText                     xpath=//*[@id\="click_me"]    tag=div    between=Foo???    from_start=6    include_locator=true

    # ${auth_code} =                             Get Text                    xpath=//*[contains(text(),'Your code is')]

    # ${auth_code} =                             Evaluate                    ''.join([c for c in $auth_code if c.isdigit()])

    # Open a new tab or window and go to the website where the authentication code is needed
    Open Browser     https://seleniumbase.io/realworld/login                 chrome
    Type Text        Enter your username         demo_user
    Type Text        Enter your password         secret_pass
    #${auth_code} =                              GetOtp                      Text
    Type Text        Enter the 6-digit MFA Code                              ${auth_code}
    Click Text       Sign in

    # # Enter the authentication code retrieved from the Outlook email
    # Type Text      Enter the code              ${auth_code}
    # Click Text     Verify or Login             # The text to click might vary depending on the website

    # Verify successful login if there's a unique element that indicates a successful login
    Verify Text      Welcome!

    # Close the browser after the test case is done
    Close Browser
