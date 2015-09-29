class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :endereco
      t.string :bairro
      t.string :cidade
      t.string :cep
      t.string :uf
      t.string :telefone
      t.string :celular
      t.date :data_nascimento
      t.string :email
      t.text :observacoes

      t.timestamps null: false
    end
  end
end
