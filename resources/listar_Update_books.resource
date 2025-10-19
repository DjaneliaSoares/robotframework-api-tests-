*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    FakerLibrary

Resource    ../config/config.resource

*** Keywords ***
Iniciar sessão com a API Books
    Create Session    api    ${BASE_URL}

Enviar a Requisição GET
    ${RESPONSE}=    GET On Session  api    ${BOOKS_URL} 
    Set Suite Variable    ${response}    ${RESPONSE}

Verificar se o status code da resposta é 200
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200

Verificar se a lista de livros retornada nao esta vazia
    ${BOOKS}=    Convert To List    ${RESPONSE.json()}
    ${QUANTIDADE}=    Get Length    ${BOOKS}
    Should Be True    ${QUANTIDADE} > 3

Enviar a requisição PUT para atualizar o livro com ID
    # Carrega exatamente o que está no ficheiro books.json
    ${PAYLOAD_BOOKS}=    Load Json From File   ${BOOKS_PAYLOAD}
    Set Suite Variable    ${PAYLOAD_BOOKS}

    # Usa o ID que já está no ficheiro
    ${ID}=    Get From Dictionary    ${PAYLOAD_BOOKS}    id

    ${RESPONSE}=    PUT On Session    api    ${BOOKS_URL}/${ID}    json=${PAYLOAD_BOOKS}
    Set Suite Variable    ${RESPONSE}

Verificar se o título do livro foi atualizado corretamente
    ${RESPONSE_BODY}=    Set Variable    ${RESPONSE.json()}
    Dictionary Should Contain Item    ${RESPONSE_BODY}    title    ${PAYLOAD_BOOKS["title"]}
