*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Library    Collections
Library    JSONLibrary    # para lidar com JSON

Resource    ../config/config.resource

*** Keywords ***
Iniciar sessão para adicionar livros
    Create Session    api    ${BASE_URL}    verify=False

Enviar a requisição POST para adicionar um novo livro
    ${payload}=    Load JSON From File    ${BOOKS_PAYLOAD}
    ${response}=    POST On Session    api    ${BOOKS_URL}    json=${payload}
    Set Suite Variable    ${response}

Verificar se o estado code da resposta é 200
    Should Be Equal As Integers    ${response.status_code}    200

Verificar se o título do livro foi adicionado corretamente
    Log    ${response.json()}
    Should Be Equal    ${response.json()["title"]}    QA Automation Book


Fazer um GET para verificar se o item foi criado
   
    ${id}=    Set Variable    1   # ID que enviaste no payload
    ${get_response}=    GET On Session    api    ${BOOKS_URL}/${id}
    Should Be Equal As Integers    ${get_response.status_code}    200
    ${book}=    Convert String To Json    ${get_response.content}
    Log    ${book}
    Should Be Equal As Strings    ${book["title"]}    Book 1