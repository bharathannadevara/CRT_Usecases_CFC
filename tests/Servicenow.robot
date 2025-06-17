# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource               ../resources/common.robot
Library                QForce
Suite Setup            Setup Browser
Suite Teardown         End suite


*** Test Cases ***
Login To ServiceNow
    [Documentation]    Automates the login process for ServiceNow.
    [Tags]             Login
    Open Browser       https://dev146135.service-now.com                       chrome
    Verify Text        User name
    Type Text          User name                   admin
    Type Secret        Password                    rh/3uLCZTx5-
    Click Text         Log in


    SetConfig        ShadowDOM                   True
    ClickText        All                         anchor=Favorites

    #Dashboard sub menu
    ClickText        Dashboards
    ClickText        Owned by Me
    ClickText        Shared with Me
    ClickText        All                         Shared with Me              recognition_mode=vision
    TypeText         Search by name or group     ServiceNow Performance      delay=2
    ClickText        ServiceNow Performance
    # VerifyText     Error: Invalid series data.
    #Toggle on & off
    ClickElement     xpath=//div[@id="show_on_graphs_button"]
    ClickElement     xpath=//*[@id\='show_on_graphs_button']/label[1]        #xpath given by CRT when recorded
    #Dropdowns
    DropDown         Graph Set                   Slow Pattern
    DropDown         Compare with Graph...       Sessions

    Search
    SetConfig        ShadowDOM                   True
    ClickText        Choose search context
    ClickText        Service Operations Workspace
    ClickText        Choose search context
    ClickText        Global

    Mark Favorite by hovering on items
    SetConfig          ShadowDOM                   True
    ClickText          All
    TypeText           Filter                      Incidents
    HoverText          Incidents
    HoverItem          Add Incidents to favorites
    ClickItem          Add Incidents to favorites
    ClickText          Done
    HoverItem          Remove Incidents from favorites
    ClickItem          Remove Incidents from favorites
    ClickText          Remove
    VerifyItem         Edit Module
    HoverItem          Edit Module                #anchor=Incidents opened on your behalf
    ClickItem          Edit Module
    HoverItem          Back
    ClickItem          Back
    ClickText          Incidents

    #Sub menu
    SetConfig          ShadowDOM                   True
    ClickText          All
    TypeText           
