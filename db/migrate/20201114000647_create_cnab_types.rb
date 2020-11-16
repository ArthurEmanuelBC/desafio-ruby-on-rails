# frozen_string_literal: true

class CreateCnabTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :cnab_types do |t|
      t.string :number
      t.string :description
      t.string :nature

      t.timestamps
    end
  end
end
