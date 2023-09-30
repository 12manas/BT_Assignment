*** Settings ***

Documentation   To Verify the Login Scenarios
Library     SeleniumLibrary
Library     BuiltIn
Library     Collections
Resource    Resources.robot


*** Variables ***


${username1}     standard_user
${username2}    performance_glitch_user
${username3}    locked_out_user
${password}     secret_sauce

*** Test Cases ***

Valid Login For "standard_user"
    Open Browser To Login Page
    Input Username      ${username1}
    Input CommonPassword    ${password}
    Submit Credentials
    Go To Navigation Button
    Click Logout Field
    Close Browser

Valid Login For "performance_glitch_user"

    Open Browser To Login Page
    Input Username      ${username2}
    Input CommonPassword    ${password}
    Submit Credentials
    Go To Navigation Button
    Click Logout Field
    Close Browser

Invalid Login for "locked_out_user"

    Open Browser To Login Page
    Input Username      ${username3}
    Input CommonPassword    ${password}
    Submit Credentials
    Verify the Error Message
    Close Browser




