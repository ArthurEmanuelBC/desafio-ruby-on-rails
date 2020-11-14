class RenameTypeToNumberFromCnabType < ActiveRecord::Migration[6.0]
  def change
    rename_column :cnab_types, :type, :number
  end
end
