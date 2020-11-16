# O projeto

Este projeto consiste em um sistema que realiza a importação de arquivo CNAB, salva os dados e exibe na tela os CNABs importados de uma determinada loja, totalizando nessa listagem o saldo da loja.

# Versões utilizadas

* Ruby 2.5.3
* Rails 6.0.3.4

# Como rodar

1. Clone o repositório em sua máquina local: `git clone git@github.com:ArthurEmanuelBC/desafio-ruby-on-rails.git`
2. Instale as dependências: `bundle install`
3. Crie e popule o banco com o seed padrão. Ele contém apenas os tipos das transações: `rails db:setup`
4. Inicie o servidor: `rails s`
5. Abrir a tela inicial do sistema: `./front/index.html`

# Estrutura

O sistema foi desenvolvido com o front e o back independentes. O back-end é uma API e possui 3 endpoints.

1. A listagem de cnabs importados (é obrigatório passar o id da loja): `GET /cnabs?store_id=id_da_loja`
2. A importação do CNAB (é obrigatório passar o arquivo TXT): `POST /cnabs`
3. A listagem de todas as lojas: `GET /stores`

O front-end foi feito de maneira bem simples. Ele está dentro da pasta `front` na raiz do projeto e possui apenas dois arquivos `HTML`.

1. A listagem dos CNABs importados da loja selecionada na view: `index.html`
2. Formulário para importação do arquivo CNAB: `upload.html`

# Documentação do CNAB

| Descrição do campo  | Inicio | Fim | Tamanho | Comentário
| ------------- | ------------- | -----| ---- | ------
| Tipo  | 1  | 1 | 1 | Tipo da transação
| Data  | 2  | 9 | 8 | Data da ocorrência
| Valor | 10 | 19 | 10 | Valor da movimentação. *Obs.* O valor encontrado no arquivo precisa ser divido por cem(valor / 100.00) para normalizá-lo.
| CPF | 20 | 30 | 11 | CPF do beneficiário
| Cartão | 31 | 42 | 12 | Cartão utilizado na transação
| Hora  | 43 | 48 | 6 | Hora da ocorrência atendendo ao fuso de UTC-3
| Dono da loja | 49 | 62 | 14 | Nome do representante da loja
| Nome loja | 63 | 81 | 19 | Nome da loja

# Documentação sobre os tipos das transações

| Tipo | Descrição | Natureza | Sinal |
| ---- | -------- | --------- | ----- |
| 1 | Débito | Entrada | + |
| 2 | Boleto | Saída | - |
| 3 | Financiamento | Saída | - |
| 4 | Crédito | Entrada | + |
| 5 | Recebimento Empréstimo | Entrada | + |
| 6 | Vendas | Entrada | + |
| 7 | Recebimento TED | Entrada | + |
| 8 | Recebimento DOC | Entrada | + |
| 9 | Aluguel | Saída | - |