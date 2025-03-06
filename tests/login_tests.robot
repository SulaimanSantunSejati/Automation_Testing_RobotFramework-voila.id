*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/LoginPage.robot
Suite Teardown    Close Browser

*** Test Cases ***
Login Successfully
    [Tags]    login
    Login    fihokob723@aqqor.com    Tonoyoga999
    Sleep    3s
    ${greeting}=    Get Greeting Text
    Should Be Equal    ${greeting}    Hi, Tono!

Login And Logout Successfully
    [Tags]    login
    Login    fihokob723@aqqor.com    Tonoyoga999
    Sleep    3s
    Click Profile
    Sleep    3s
    Click Sign Out
    Sleep    3s
    ${sign_in}=    Get Sign In Text
    Should Be Equal    ${sign_in}    Sign In
    ${register}=    Get Register Text
    Should Be Equal    ${register}    Register

Login With Unregistered Email
    [Tags]    login
    Open Login Page
    Enter Username    blabla123@gmail.com
    Sleep    3s
    Click Login
    Sleep    3s
    ${unregistered}=    Get Unregistered Text
    Should Be Equal    ${unregistered}    Register

Login With Invalid Password
    [Tags]    login
    Login    fihokob723@aqqor.com    Invalidpassword123
    Sleep    2s
    ${invalid_pass}=    Get Invalid Password Text
    Should Be Equal    ${invalid_pass}    Your account ID or password is incorrect. Please try again.

Login With Invalid Email Format
    [Tags]    login
    Open Login Page
    Enter Username    invalidemail
    Sleep    2s
    Click Login
    Sleep    2s
    ${empty_email}=    Get Empty Email Text
    Should Be Equal    ${empty_email}    Please enter a valid email format or phone number.

Login With Empty Username
    [Tags]    login
    Open Login Page 
    Sleep    2s
    Enter Username  ${EMPTY}   
    Click Login
    Sleep    2s
    ${empty_email}=    Get Empty Email Text
    Should Be Equal    ${empty_email}    Please enter email or phone number.

Forgot Password Test
    [Tags]    login
    Open Login Page
    Sleep    1s
    Enter Username    fihokob723@aqqor.com
    Sleep    3s
    Click Forgot Password 1
    Sleep    3s
    Enter Username    fihokob723@aqqor.com
    Sleep    3s
    Click Forgot Password 2
    Sleep    3s
    ${forgot_pass}=    Get Forgot Password Text
    Should Be Equal    ${forgot_pass}    Enter the verification code we sent to your registered email.
