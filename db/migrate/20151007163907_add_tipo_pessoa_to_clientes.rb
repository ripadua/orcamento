class AddTipoPessoaToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :tipo_pessoa, :fixnum
  end
end
