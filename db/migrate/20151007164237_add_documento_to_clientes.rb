class AddDocumentoToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :documento, :string
  end
end
