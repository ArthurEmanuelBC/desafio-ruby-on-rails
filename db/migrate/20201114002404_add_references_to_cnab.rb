class AddReferencesToCnab < ActiveRecord::Migration[6.0]
  def change
    add_reference :cnab_types, :cnab, index: true
    add_reference :stores, :cnab, index: true
  end
end
