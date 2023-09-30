*** Settings ***

Documentation   To Verify the Items Sorting Validation
Library     SeleniumLibrary
Library     BuiltIn
Library     Collections
Library    String
Resource    Resources.robot

*** Variables ***
${username1}     standard_user
${password}     secret_sauce
@{Price_Total_H+L}


*** Test Cases ***

Verify items in cart are retained in cart after logout
    Open Browser To Login Page
    Input Username      ${username1}
    Input CommonPassword    ${password}
    Submit Credentials
    Select Add to Cart Button for Random Three Products
    Go To Navigation Button
    Click Logout Field
    Input Username      ${username1}
    Input CommonPassword    ${password}
    Submit Credentials
    Select Cart To See Previously Added Items
    Remove the Products Added
    Go To Navigation Button
    Click Logout Field
    Close Browser

Verify user can place order
    Open Browser To Login Page
    Input Username      ${username1}
    Input CommonPassword    ${password}
    Submit Credentials
    Select Add to Cart Button for TWO Products
    Select Cart
    Select Checkout Button
    Provide Input to All Fields Present in Checkout overview page
    Select Continue Button
    Verify Total Price And Place Order
    Go To Navigation Button
    Click Logout Field
    Close Browser


*** Keywords ***
Select Add to Cart Button for Random Three Products
    Click Button    xpath= //button[@name='add-to-cart-sauce-labs-backpack']
    Wait Until Element Is Visible    xpath= //span[contains(text(),'1')]
    Click Button    xpath = //button[@name='add-to-cart-sauce-labs-bike-light']
    Wait Until Element Is Visible    xpath= //span[contains(text(),'2')]
    Click Button    xpath = //button[@name='add-to-cart-sauce-labs-bolt-t-shirt']
    Wait Until Element Is Visible    xpath= //span[contains(text(),'3')]



Select Cart To See Previously Added Items
    Select Cart
    Element Should Be Visible    xpath= //div[@class='inventory_item_name' and contains(text(),'Sauce Labs Backpack')]
    Element Should Be Visible    xpath= //div[@class='inventory_item_name' and contains(text(),'Sauce Labs Bike Light')]
    Element Should Be Visible    xpath= //div[@class='inventory_item_name' and contains(text(),'Sauce Labs Bolt T-Shirt')]
    
Remove the Products Added
    Click Element    xpath= //button[@name='remove-sauce-labs-backpack']
    Wait Until Element Is Visible    xpath= //span[contains(text(),'2')]
    Click Element    xpath= //*[@id='remove-sauce-labs-bike-light']
    Wait Until Element Is Visible    xpath= //span[contains(text(),'1')]
    Click Element    xpath= //*[@id='remove-sauce-labs-bolt-t-shirt']

Select Add to Cart Button for TWO Products
    Click Element    xpath= //button[@name='add-to-cart-sauce-labs-fleece-jacket']
    Wait Until Element Is Visible    xpath= //span[contains(text(),'1')]
    Click Element    xpath= //button[@name='add-to-cart-sauce-labs-onesie']
    Wait Until Element Is Visible    xpath= //span[contains(text(),'2')]



Verify Total Price And Place Order
    @{Price_Total_H+L}    Create List   Total:  $62.62
    ${Total_Price}      Get Text    xpath= //*[@class='summary_info_label summary_total_label']
    @{Total_Price}=   Split String     ${Total_Price}



    Run Keyword If    @{Price_Total_H+L} == @{Total_Price}
    ...    Click Element    xpath= //*[@id='finish']
    Wait Until Element Is Visible    xpath= //*[@id='checkout_complete_container']//descendant::h2[contains(text(),'Thank you for your order!')]
    Click Element    xpath= //*[@id='back-to-products']







