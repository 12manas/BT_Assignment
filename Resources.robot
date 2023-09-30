*** Settings ***

Documentation   Contains Common Keywords For All Test Scenarios
Library     SeleniumLibrary
Library     BuiltIn
Library     Collections

*** Variables ***
${BROWSER}  Chrome
${URL}   https://www.saucedemo.com/


*** Keywords ***

Open Browser To Login Page

    Create Webdriver    Chrome      executable_path=C:\\ocssautomation\\chromedriver.exe
    Go To    ${URL}
    Title Should Be    Swag Labs

Input Username
    [Arguments]     ${username}
    Input Text    xpath= //*[@id='user-name']   ${username}

Input CommonPassword
    [Arguments]     ${password}
    Input Text    xpath= //*[@id='password']    ${password}

Submit Credentials
    Click Element    xpath= //*[@id='login-button']

Go To Navigation Button
    Click Element    xpath=//*[@id='react-burger-menu-btn']
    Wait Until Element Is Visible    xpath= //div[@class='bm-menu']//descendant::a[@id='logout_sidebar_link']

Click Logout Field
    Click Element    xpath= //*[@id='logout_sidebar_link' and contains(text(),'Logout')]
    Title Should Be    Swag Labs


Verify the Error Message
    Wait Until Element Is Visible    xpath= //*[@class='error-message-container error']/h3
    Element Text Should Be   xpath= //*[@class='error-message-container error']//descendant::*[contains(text(),'Epic sadface: Sorry, this user has been locked out.')]   Epic sadface: Sorry, this user has been locked out.

Verify the Default Sorting Order is A TO Z
    Element Should Be Visible    xpath= //span[@class='active_option' and contains(text(),'Name (A to Z)')]

Change The Order to High To Low
    Click Element    xpath= //select[@class='product_sort_container']
    Click Element    xpath= //select[@class='product_sort_container']//option[@value='hilo' and contains(text(),'Price (high to low)')]
    Element Should Be Visible    xpath= //*[@class='inventory_item_name' and contains(text(),'Sauce Labs Fleece Jacket')]


Select Cart
    Click Element    xpath= //div[@id='shopping_cart_container']/a

Select Checkout Button
    Click Element    xpath= //*[@id='checkout']

Select Continue Button
    Click Element    xpath= //*[@id='continue']

Provide Input to All Fields Present in Checkout overview page
    Wait Until Element Is Visible    xpath= //span[contains(text(),'Checkout: Your Information')]
    Input Text    xpath= //*[@id='first-name']    Manas
    Input Text    xpath= //*[@id='last-name']    Chaturvedi
    Input Text    xpath= //*[@id='postal-code']    283135
