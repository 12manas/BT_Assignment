*** Settings ***

Documentation   To Verify the Items Sorting Validation
Library     SeleniumLibrary
Library     BuiltIn
Library     Collections
Resource    Resources.robot

*** Variables ***
${username1}     standard_user
${password}     secret_sauce

*** Test Cases ***

Verify default sort order
    Open Browser To Login Page
    Input Username      ${username1}
    Input CommonPassword    ${password}
    Submit Credentials
    Verify the Default Sorting Order is A TO Z
    Go To Navigation Button
    Click Logout Field
    Close Browser

Verify Whether "standard-user" is able to change the Default Order
    Open Browser To Login Page
    Input Username      ${username1}
    Input CommonPassword    ${password}
    Submit Credentials
    Verify the Default Sorting Order is A TO Z
    Change The Order to High To Low
    Go To Navigation Button
    Click Logout Field

