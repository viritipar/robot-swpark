*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://automationpractice.com
${browser}        gc

*** Keywords ***
Open
    Open Browser    ${url}    ${browser}    #headlesschrome
    Title Should Be    My Store

Choose menu
    Click Element    //*[@id="block_top_menu"]/ul/li[2]/a

Home
    Go To    ${url}
