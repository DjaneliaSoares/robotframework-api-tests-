
*** Settings ***
Library   Collections
Library   String

*** Variables ***
${BASE_URL}         https://fakerestapi.azurewebsites.net 
${USERS_URL}        /api/v1/Users
${BOOKS_URL}        api/v1/Books
${USERS_PAYLOAD}    ${CURDIR}/payload/users.json
${BOOKS_PAYLOAD}    ${CURDIR}/payload/books.json




