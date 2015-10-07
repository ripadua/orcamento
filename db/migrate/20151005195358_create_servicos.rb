class CreateServicos < ActiveRecord::Migration
  def change
    create_table :servicos do |t|
      t.string :nome
      t.string :unidade
      t.decimal :valor

      t.timestamps null: false
    end
  end
end
