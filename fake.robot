*** Settings ***
Library           FakerLibrary

*** Test Cases ***
Fake data
    Comment    https://guykisel.github.io/robotframework-faker/
    ${data1}    First Name
    Log To Console    ${data1}
    ${data2}    First Name
    Log To Console    ${data2}
