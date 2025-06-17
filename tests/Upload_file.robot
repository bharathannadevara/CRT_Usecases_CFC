# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource                   ../resources/common.robot
Library                    QWeb
Library                    QForce
Library                    QVision
Library                    Collections
Suite Setup                Open Browser                about:blank                 chrome
Suite Teardown             Close All Browsers


# *** Variables ***
# ${FILE}                    Demo.txt

*** Test Cases ***
    [Tags]                 Text file# File Upload from CRT local
    Runkeyword             Login
    LaunchApp              Sales
    ClickText              Accounts
    ClickText              New
    TypeText               *Account Name               Otis
    ClickText              Save                        partial_match=False         # Do not accept partial match, i.e. "Save All"

    ClickText              Related
    ClickText              Upload Files
    
    ${FILE_PATH}           Set Variable                ${CURDIR}/files/${FILE}
    Log                    ${FILE_PATH}                console=true
    
    QVision.DoubleClick    suite                       anchor=9
    # QVision.DoubleClick    resources                       anchor=3
    #QVision.ClickText      Demo.txt
    QVision.ClickText      Open                        anchor=Cancel
    
    ClickText              Done 
