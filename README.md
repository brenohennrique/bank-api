# Bank API
 API desenvolvida para simular um sistema de contas bancárias, a aplicação foi desenvolvida utilizando **[ Ruby On Rails](https://rubyonrails.org/)** e **[MySql](https://www.mysql.com/)** como banco de dados. Foi desenvolvido também os testes automatizados para aplicação utilizando o **[RSpec](https://rspec.info/)** como suite de testes.
Aplicação foi desenvolvida na **versão do [Ruby](https://www.ruby-lang.org/pt/) 2.6.3**.

## Requisitos
Para estar utilizando a aplicação de utilizando a aplicação de uma maneira simples, foi utilizado **[Docker](https://www.docker.com/)** para isso e devido a aplicação possuir algumas dependências *(como por exemplo: banco de dados "MySql")* foi utilizado o **Docker Compose** para orquestrar os *container*.

**Passo 1**: Instalar o **[Docker](https://www.docker.com/)**.
**Passo 2**: Instalar o **Docker-Compose**.

## Utilização
Para estar executando a API foi criado um *container* utilizando .

Executar aplicação:
`docker-compose up` ou `docker-compose up -d`

Parar aplicação:
`docker-compose down`


## Outras documentações
- [Dependências](https://github.com/brenohennrique/bank-api/blob/master/docs/dependencies.md)
- [Documentação das rotas](https://github.com/brenohennrique/bank-api/blob/master/docs/routes.md)
