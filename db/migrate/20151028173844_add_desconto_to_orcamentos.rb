class AddDescontoToOrcamentos < ActiveRecord::Migration
  def change
    add_column :orcamentos, :desconto, :decimal
  end
end
