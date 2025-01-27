# Gestão de Cursos - API e Cliente

Este projeto consiste em uma **API RESTful** para gerenciamento de cursos e um **cliente** que consome os endpoints da API. Ambos foram desenvolvidos em Dart e organizados em uma estrutura modular.

---

## **Estrutura do Projeto**

```
gestao_cursos_project/
├── api/                # Projeto da API
│   ├── bin/            # Contém o servidor principal
│   ├── lib/            # Código fonte da API (modelos, rotas, serviços)
│   ├── pubspec.yaml    # Dependências do projeto
│   └── README.md       # Documentação da API
├── client/             # Projeto do cliente
│   ├── lib/            # Código principal do cliente
│   ├── pubspec.yaml    # Dependências do projeto
│   └── README.md       # Documentação do cliente
└── README.md           # Documentação geral
```

---

## **Instruções de Uso**

### 1. Clone o Repositório
```bash
git clone <URL_DO_REPOSITORIO>
cd gestao_cursos_project
```

### 2. Configuração da API
1. Acesse o diretório da API:
   ```bash
   cd api
   ```
2. Instale as dependências:
   ```bash
   dart pub get
   ```
3. Inicie o servidor:
   ```bash
   dart run bin/server.dart
   ```
4. A API estará disponível em: [http://localhost:8080](http://localhost:8080).

---

### 3. Configuração do Cliente
1. Acesse o diretório do cliente:
   ```bash
   cd ../client
   ```
2. Instale as dependências:
   ```bash
   dart pub get
   ```
3. Execute o cliente para consumir a API:
   ```bash
   dart run lib/client.dart
   ```

---

## **Endpoints Disponíveis na API**

- **Listar todos os cursos**
  - Método: `GET`
  - Rota: `/cursos`
  - Retorna: Lista de cursos cadastrados.

- **Obter detalhes de um curso**
  - Método: `GET`
  - Rota: `/cursos/{id}`
  - Retorna: Detalhes de um curso específico.

- **Criar um novo curso**
  - Método: `POST`
  - Rota: `/cursos`
  - Corpo da requisição:
    ```json
    {
      "title": "Curso de Dart",
      "description": "Aprenda Dart do básico ao avançado",
      "duration": 40
    }
    ```

- **Atualizar um curso**
  - Método: `PUT`
  - Rota: `/cursos/{id}`
  - Corpo da requisição:
    ```json
    {
      "title": "Curso de Flutter",
      "description": "Aprenda Flutter com Dart",
      "duration": 50
    }
    ```

- **Excluir um curso**
  - Método: `DELETE`
  - Rota: `/cursos/{id}`
