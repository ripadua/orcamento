class CreateOrcamentoServicos < ActiveRecord::Migration
  def change
    create_table :orcamento_servicos do |t|
      t.belongs_to :orcamento, index: true
      t.belongs_to :servico, index: true
      t.integer :quantidade
      t.timestamps null: false
    end
  end
end
