# Rotas

## Registrar conta
Endpoint responsável para registrar as contas.

- **Rota**
`#{BASE_PATH}/v1/accounts`
- **Método**
*POST*
- **Parâmetros**
	```json
	{
	  "name": "name",
	  "balance_amount": 1500.00,
	  "password": "password",
	  "password_confirmation": "password"
	}
	```

## Autenticar
Endpoint responsável para conceder o token utilizando para se autenticar nas rotas necessárias.

- **Rota**
`#{BASE_PATH}/v1/singup`
- **Método**
*POST*
- **Parâmetros**
	```json
	{
	  "name": "name",
      "password": "password"
	}
	```

## Realizar transferência
Endpoint responsável por realizar a transferência bancaria, utilizando a conta autenticada *(reconhecida através do token jwt informado)* como referência.

- **Rota**
`#{BASE_PATH}/v1/singup`
- **Método**
*POST*
- **Headers**
`"Authorization"  =>  "Bearer #{TOKEN_JWT}"`
- **Parâmetros**
	```json
	{
	  "amount": 500.00,
	  "destination_account_id": "id_conta_destino"
	}
	```

### Consultar saldo
Endpoint responsável por fornecer o saldo da conta autenticada *(reconhecida através do token jwt informado)*.

- **Rota**
`#{BASE_PATH}/v1/accounts/balance`
- **Método**
*GET*
- **Headers**
`"Authorization"  =>  "Bearer #{TOKEN_JWT}"`
