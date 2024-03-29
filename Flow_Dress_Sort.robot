*** Settings ***
Suite Setup       เข้า web หน้าแรก
Suite Teardown    Close Browser
Test Teardown     Welcome.Home
Library           SeleniumLibrary
Resource          pages/welcome.robot
Resource          pages/catalog.robot

*** Variables ***
${url}            http://automationpractice.com
${browser}        gc

*** Test Cases ***
Sorting by price
    [Tags]    Progress
    Comment    เข้า web หน้าแรก
    เข้าไปยังหน้า summer dress
    ทำการเลือก sort ด้วย price จากมากไปน้อย
    ผลการทำงานแสดงถูกต้อง

Sorting by price2
    [Tags]    Progress
    Comment    เข้า web หน้าแรก
    เข้าไปยังหน้า summer dress
    ทำการเลือก sort ด้วย price จากมากไปน้อย
    ผลการทำงานแสดงถูกต้อง

Sorting by price3
    [Tags]    Test
    Comment    เข้า web หน้าแรก
    เข้าไปยังหน้า summer dress
    ทำการเลือก sort ด้วย price จากมากไปน้อย
    ผลการทำงานแสดงถูกต้อง

*** Keywords ***
เข้า web หน้าแรก
    Welcome.Open
    Comment    Open Browser    ${url}    ${browser}
    Comment    Title Should Be    My Store

เข้าไปยังหน้า summer dress
    Catalog.Choose Dress
    Comment    Click Element    //*[@id="block_top_menu"]/ul/li[2]/a
    Catalog.Choose Summer Dress
    Comment    Wait Until Page Contains    Summer Dresses
    Comment    Click Element    //*[@id="categories_block_left"]/div/ul/li[3]/a

ทำการเลือก sort ด้วย price จากมากไปน้อย
    Catalog.Sort Desc
    Comment    Select From List By Value    selectProductSort    price:desc
    Comment    Page Should Contain    Loading
    Comment    Sleep    3

ผลการทำงานแสดงถูกต้อง
    Catalog.Validate Sort
    Comment    # Check Name
    Comment    ${itemName}    Get Text    //*[@id="center_column"]/ul/li[1]/div/div[2]/h5/a
    Comment    Should Be Equal    ${itemName}    Printed Summer Dress
    Comment    # Check Price
    Comment    ${itemPrice}    Get Text    //*[@id="center_column"]/ul/li[1]/div/div[2]/div[1]/span[1]
    Comment    Should Be Equal    ${itemPrice}    $28.98
