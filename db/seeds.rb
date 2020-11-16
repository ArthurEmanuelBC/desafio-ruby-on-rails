# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create defaults CnabTypes
CnabType.create(number: '1', description: 'Débito', nature: :inflow)
CnabType.create(number: '2', description: 'Boleto', nature: :outflow)
CnabType.create(number: '3', description: 'Financiamento', nature: :outflow)
CnabType.create(number: '4', description: 'Crédito', nature: :inflow)
CnabType.create(number: '5', description: 'Recebimento Empréstimo', nature: :inflow)
CnabType.create(number: '6', description: 'Vendas', nature: :inflow)
CnabType.create(number: '7', description: 'Recebimento TED', nature: :inflow)
CnabType.create(number: '8', description: 'Recebimento DOC', nature: :inflow)
CnabType.create(number: '9', description: 'Aluguel', nature: :outflow)
