class CreateCnabs < ActiveRecord::Migration[6.0]
  def change
    create_table :cnabs do |t|
      t.datetime :occurence_at
      t.decimal :value, precision: 10, scale: 2
      t.string :cpf
      t.string :card_number

      t.timestamps
    end
  end
end
