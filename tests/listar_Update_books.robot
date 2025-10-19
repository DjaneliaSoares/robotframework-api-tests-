*** Settings ***
Library    RequestsLibrary

Resource    ../config/config.resource
Resource    ../resources/listar_Update_books.resource

*** Test Cases ***
Listar todos os livros
    Iniciar sessão com a API Books
    Enviar a Requisição GET
    Verificar se o status code da resposta é 200
    Verificar se a lista de livros retornada nao esta vazia
Atualizar um livro existente pelo ID com dados válidos
    Iniciar sessão com a API Books
    Enviar a requisição PUT para atualizar o livro com ID
    Verificar se o status code da resposta é 200
    Verificar se o título do livro foi atualizado corretamente


  