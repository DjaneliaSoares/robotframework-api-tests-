*** Settings ***
Library    RequestsLibrary

Resource    ../config/config.resource
Resource    ../resources/listar_Update_books.resource
Resource    ../resources/Add_Books.resource

*** Test Cases ***
Adicionar um novo livro com dados válidos
    Iniciar sessão para adicionar livros
    Enviar a requisição POST para adicionar um novo livro
    Verificar se o estado code da resposta é 200
    Verificar se o título do livro foi adicionado corretamente

Listar Item adicionado

  Fazer um GET para verificar se o item foi criado
    