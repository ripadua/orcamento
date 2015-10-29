class AddLocalServicoToOrcamentos < ActiveRecord::Migration
  def change
    add_column :orcamentos, :local_servico, :String
  end
end
