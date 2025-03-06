*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_LOGIN}       https://voila.id/account/login
${URL_UNLOGIN}     https://voila.id/

# Locators
${USERNAME_INPUT}  name=identifier
${PASSWORD_INPUT}  name=password
${LOGIN_BUTTON}    css=[data-test-id='CT_component_login_submit']
${PROFILE_BUTTON}  css=[data-test-id="CT_Component_ProfileMenu"]
${SIGN_OUT_BUTTON1}  css=[data-test-id="CT_account_navigation-item_Sign Out"]
${SIGN_OUT_BUTTON2}  css=[data-test-id="CT_SignOut_Confirm"]
${SIGN_IN_TEXT}    css=[data-test-id='CT-SignIn-Btn']
${REGISTER_TEXT}   css=[data-test-id='CT-Register-Btn']
${UNREGIST_TEXT}   css=._15kd2weog._17zx15t9c._17zx15t6p._17zx15tgg._17zx15thd._17zx15te8._17zx15t4g#base
${INVALID_PASS_TEXT}  css=._7q2fqh7#base
${EMPTY_EMAIL_TEXT}   css=p._15kd2wejk._1ccbe2w0._1ccbe2wd#base
${FORGOT_PASSWORD_BUTTON1}  css=[data-test-id="CT_Link_forgotPassword"]
${FORGOT_PASSWORD_BUTTON2}  css=[data-test-id="CT_Component_UpdatePassword_Submit"]
${FORGOT_PASSWORD_TEXT}     css=p._15kd2weow._15r4f4dap._15r4f4dg9.wovzoqj._1ccbe2w0._1ccbe2wc#base
${GREETING_TEXT}            css=p._15kd2weps._17zx15tdc._1ccbe2w0._1ccbe2wc#base

*** Keywords ***
Open Login Page
    # 1) Buat object ChromeOptions
    ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium.webdriver
    # 2) Tambah argumen disable-notifications
    Call Method    ${options}    add_argument    --disable-notifications
    # 3) Buat WebDriver Chrome pakai options
    Create WebDriver    Chrome    options=${options}
    Maximize Browser Window
    Go To    ${URL_LOGIN}
    Wait Until Element Is Visible    ${USERNAME_INPUT}

Login
    [Arguments]    ${username}    ${password}
    # Buka browser & halaman login
    Open Login Page
    # Masukkan username & password
    Input Text    ${USERNAME_INPUT}    ${username}
    Sleep    3s
    Input Text    ${PASSWORD_INPUT}    ${password}
    # Klik tombol login
    Click Element    ${LOGIN_BUTTON}
    Sleep    2s
Unlogin
    Open Home Page
Get Greeting Text
    ${text}=    Get Text    ${GREETING_TEXT}
    [Return]    ${text}

Enter Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_INPUT}    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text    ${PASSWORD_INPUT}    ${password}

Click Login
    Click Element    ${LOGIN_BUTTON}
Click Username
    Click Element ${USERNAME_INPUT}
Click Profile
    Click Element    ${PROFILE_BUTTON}

Click Sign Out
    Click Element    ${SIGN_OUT_BUTTON1}
    Sleep    3s
    Click Element    ${SIGN_OUT_BUTTON2}

Get Sign In Text
    ${text}=    Get Text    ${SIGN_IN_TEXT}
    [Return]    ${text}

Get Register Text
    ${text}=    Get Text    ${REGISTER_TEXT}
    [Return]    ${text}

Get Unregistered Text
    ${text}=    Get Text    ${UNREGIST_TEXT}
    [Return]    ${text}

Get Invalid Password Text
    ${text}=    Get Text    ${INVALID_PASS_TEXT}
    [Return]    ${text}

Get Empty Email Text
    ${text}=    Get Text    ${EMPTY_EMAIL_TEXT}
    [Return]    ${text}

Click Forgot Password 1
    Click Element    ${FORGOT_PASSWORD_BUTTON1}
Click Forgot Password 2
    Click Element    ${FORGOT_PASSWORD_BUTTON2}

Get Forgot Password Text
    ${text}=    Get Text    ${FORGOT_PASSWORD_TEXT}
    [Return]    ${text}

Open Home Page
    ${options}=    Evaluate    selenium.webdriver.ChromeOptions()    modules=selenium.webdriver
    # 2) Tambah argumen disable-notifications
    Call Method    ${options}    add_argument    --disable-notifications
    # 3) Buat WebDriver Chrome pakai options
    Create WebDriver    Chrome    options=${options}
    Maximize Browser Window
    Go To    ${URL_UNLOGIN}
