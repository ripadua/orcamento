class AddContatoToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :contato, :string
  end
end
