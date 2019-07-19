*** Settings ***
Library           RequestsLibrary

*** Test Cases ***
validate api get
    Comment    http://bulkan.github.io/robotframework-requests/
    Create Session    api    https://jsonplaceholder.typicode.com
    #Check response
    ${response}    Get Request    api    /users
    Should Be Equal    ${200}    ${response.status_code}
    #Check Length
    ${length}    Get Length    ${response.json()}
    Log To Console    ${length}
    Should Be Equal    ${10}    ${length}
    #Check username
    Should Be Equal    Bret    ${response.json()[0]["username"]}
