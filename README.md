<h1 align="center">🧪 Testes Automatizados de API - Robot Framework</h1>

<p align="center">
  <img src="https://img.shields.io/badge/STATUS-CONCLUÍDO-blue?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/Robot%20Framework-Testing-red?style=for-the-badge&logo=robotframework"/>
  <img src="https://img.shields.io/badge/API-Automation-yellow?style=for-the-badge&logo=postman"/>
</p>

---

## 📝 Descrição do Projeto

> Repositório dedicado à automação de testes de **API REST** utilizando o **Robot Framework**.  
> Cada suíte de teste cobre um conjunto de endpoints e validações relacionadas a diferentes módulos do sistema.  
> Os cenários incluem **criação de usuários**, **adição de livros**, e **listagem/atualização de registros**.
---
## Objetivo: 

Garantir a estabilidade e integridade dos serviços da API através de testes automatizados de integração e regressão.

## 🧩 Estrutura do Projeto

````bash
📂 TESTE_DE_API
┣ 📂 config
┃ ┣ 📂 payload
┃ ┗ 📜 config.resource
┣ 📂 report
┣ 📂 resources
┃ ┣ 📜 Add_Books.resource
┃ ┣ 📜 criar_usuario.resource
┃ ┗ 📜 listar_Update_books.resource
┣ 📂 tests
┃ ┣ 📜 Add_Books.robot
┃ ┣ 📜 criar_usuario.robot
┃ ┗ 📜 listar_Update_books.robot
┗ 📜 requirements.txt
`````

---

## 🧰 Tecnologias e Bibliotecas Utilizadas

- 🤖 **Robot Framework** — Framework principal de automação
- 🌐 **RequestsLibrary** — Interações com endpoints HTTP
- 🧩 **JSONLibrary** — Validação de respostas e manipulação de JSON
- 🧮 **CollectionsLibrary** — Tratamento de listas e dicionários
- 🐍 **Python** — Base para execução dos testes

---

## 🧷 Suites de Teste

| Suíte | Descrição |
|:------|:-----------|
| 📘 `Add_Books.robot` | Testes de criação e validação de livros na API |
| 👤 `criar_usuario.robot` | Testes relacionados ao cadastro e autenticação de usuários |
| 📚 `listar_Update_books.robot` | Testes de listagem, atualização e verificação de dados de livros |

Execução:
```bash
robot -d result tests/
```
Executar uma suíte específica:
```bash
robot -d report tests/criar_usuario.robot
```
📁 Os relatórios são gerados automaticamente na pasta:
```bash
/report/log.html
/report/report.html
```
👩🏽‍💻 Autora

Djanélia Gonçalves
💼 Estudante de Engenharia Informática
🌍 Foco em Qualidade de Software (QA) & Automação de Testes
🔗 LinkedIn | GitHub

<p align="center">💡 <i>Projeto criado para demonstrar habilidades práticas em QA, automação de testes de API e integração contínua.</i></p> ```
