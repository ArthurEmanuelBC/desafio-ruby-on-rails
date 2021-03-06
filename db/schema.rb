# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_201_114_001_618) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cnab_types', force: :cascade do |t|
    t.string 'number'
    t.string 'description'
    t.string 'nature'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'cnabs', force: :cascade do |t|
    t.datetime 'occurence_at'
    t.decimal 'value', precision: 10, scale: 2
    t.string 'cpf'
    t.string 'card_number'
    t.bigint 'store_id'
    t.bigint 'cnab_type_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['cnab_type_id'], name: 'index_cnabs_on_cnab_type_id'
    t.index ['store_id'], name: 'index_cnabs_on_store_id'
  end

  create_table 'stores', force: :cascade do |t|
    t.string 'name'
    t.string 'agent'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end
end
