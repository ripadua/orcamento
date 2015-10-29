class AddFlagLocalDiferente < ActiveRecord::Migration
  def change
    add_column :orcamentos, :flag_local_diferente, :boolean
  end
end
