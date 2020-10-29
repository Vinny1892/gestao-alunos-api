# GestaoAlunos

Repositório criado com o propósito de exemplificar a utilização do Elixir com a arquitetura RESTful para alunos da UFMS - Universidade Federal de Mato Grosso do Sul

<a href="https://insomnia.rest/run/?label=students-api&uri=https%3A%2F%2Fraw.githubusercontent.com%2FVinny1892%2Fgestao-alunos-api%2Fdeveloper%2Futils%2Fdata.json" target="_blank"><img src="https://insomnia.rest/images/run.svg" alt="Run in Insomnia"></a>

Para inicializar o projeto é possível através do Docker-compose e do mix, ambos os métodos precisam configurar .env, por isso renomeei o arquivo .env.example para .env.

## Docker-compose

Para inicializar a API e o Postgres basta execultar o seguinte comando.

```shell
docker-compose up -d
```

## Mix

Pelo mix será necessário possuir o Postgres disponível para a API funcionar.

Install dependencies with

```shell
mix deps.get
```

Create and migrate your database with

```shell
mix ecto.setup
```

Start Phoenix endpoint

```shell
mix phx.server
```

## Instalação do Docker

```shell
curl -fsSL https://get.docker.com | sh
```

Por motivos de praticidade considere adicionar o usuário ao grupo "docker".

```shell
   usermod -aG docker $USER
```

## Instalação do Docker-compose

Execute este comando para baixar a versão estável atual do Docker Compose:

```shell
   curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Aplique permissões executáveis ​​ao binário:

```shell
   chmod +x /usr/local/bin/docker-compose
```

Nota: Se o comando docker-compose falhar após a instalação, verifique a path. Você também pode criar um link simbólico para /usr/bin ou qualquer outro diretório em seu caminho

```shell
   ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

## Remover os containers, volumes e network

```shell
   docker-compose down
```
