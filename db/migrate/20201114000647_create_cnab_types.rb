class CreateCnabTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :cnab_types do |t|
      t.string :type
      t.string :description
      t.string :nature

      t.timestamps
    end
  end
end
