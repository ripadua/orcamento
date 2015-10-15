class CreateOrcamentos < ActiveRecord::Migration
  def change
    create_table :orcamentos do |t|
      t.date :data
      t.references :cliente, index: true, foreign_key: true
      t.string :descricao
      t.string :forma_pagamento
      t.string :observacoes
      t.date :validade

      t.timestamps null: false
    end
  end
end
