*** Settings ***
Library    OperatingSystem
Library    Collections
Library    JSONLibrary
Library    String
Library    RequestsLibrary

Resource    ../config/config.resource

*** Keywords ***
Criar Usuario
    Create Session    api    ${BASE_URL}    disable_warnings=1
    ${PAYLOAD_DICT}    ${PAYLOAD_STR}=    Montar payload de usuario válido
    ${HEADERS}=    Create Dictionary    Content-Type=application/json
    ${RESP}=    POST On Session    api    ${USERS_URL}    data=${PAYLOAD_STR}    headers=${HEADERS}
    Validar a resposta de criação de usuario    ${RESP}    ${PAYLOAD_DICT}

Montar payload de usuario válido
    ${BODY}=    Load Json From File    ${USERS_PAYLOAD}
    ${RAND_ID}=    Generate Random String    2    [NUMBERS]
    ${ID}=    Convert To Integer    ${RAND_ID}
    ${RAND_SUFFIX}=    Generate Random String    6    [LOWER]

    Set To Dictionary    ${BODY}    id=${ID}
    Set To Dictionary    ${BODY}    userName=${BODY['userName']}${RAND_SUFFIX}

    ${BODY_STR}=    Convert JSON To String    ${BODY}
    RETURN    ${BODY}    ${BODY_STR}

Validar a resposta de criação de usuario
    [Arguments]    ${RESP}    ${BODY}
    ${STATUS}=    Set Variable    ${RESP.status_code}
    IF    ${STATUS} != 201 and ${STATUS} != 200
        Fail    Status code is invalid: ${STATUS}. Response: ${RESP.content}
    END

    ${JSON}=    Convert String To Json    ${RESP.content}
    Dictionary Should Contain Key    ${JSON}    id 
    Dictionary Should Contain Key    ${JSON}    userName
    Should Be Equal As Strings    ${JSON['userName']}    ${BODY['userName']}
