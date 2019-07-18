*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
Choose Dress
    Click Element    //*[@id="block_top_menu"]/ul/li[2]/a

Choose Summer Dress
    Wait Until Page Contains    Summer Dresses
    Click Element    //*[@id="categories_block_left"]/div/ul/li[3]/a

Sort Desc
    Select From List By Value    selectProductSort    price:desc
    Page Should Contain    Loading
    Sleep    3

Validate Sort
    # Check Name
    ${itemName}    Get Text    //*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a
    Should Be Equal    ${itemName}    Printed Summer Dress
    # Check Price
    ${itemPrice}    Get Text    //*[@id="center_column"]/ul/li[1]/div/div[2]/div[1]/span[1]
    Should Be Equal    ${itemPrice}    $28.98
