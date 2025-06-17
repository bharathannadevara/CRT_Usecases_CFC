*** Settings ***
Resource              ../resources/common.robot
#Library              Browser
Library               QWeb
#Library              totp.py
Suite Setup           Setup Browser
Suite Teardown        End suite

# *** Variables ***
# ${BROWSER}          chromium
# ${HEADLESS}         False


*** Test Cases ***
Read TOTP code from browser
    open browser      https://seleniumbase.io/realworld/signup    chrome
    # Sleep           2
    Verify Text       TOTP Code:                  timeout=10
    ${auth_code} =    Get Text                    TOTP Code:      timeout=10

    #Login with MFA
    Open Browser      https://seleniumbase.io/realworld/login     chrome
    Type Text         Enter your username         demo_user
    Type Text         Enter your password         secret_pass
    ${auth_code}      GetOtp                      text            GAXG2MTEOR3DMMDG
    Type Text         Enter the 6-digit MFA Code                  ${auth_code}
    Click Text        Sign in
    Verify Text       Welcome!
