class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :uf
      t.string :cidade
      t.string :bairro
      t.string :endereco_completo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
