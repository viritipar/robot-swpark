*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://automationpractice.com
${browser}        gc

*** Keywords ***
Open
    Open Browser    ${url}    ${browser}
    Title Should Be    My Store

Choose menu
    Click Element    //*[@id="block_top_menu"]/ul/li[2]/a
    Comment    Open Browser    http://automationpractice.com    headlesschrome
