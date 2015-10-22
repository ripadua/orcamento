class Orcamento < ActiveRecord::Base
  belongs_to :cliente
  
  has_many :orcamento_servicos, :dependent => :destroy
  has_many :servicos, :through => :orcamento_servicos
  
  def valor_total
    total = 0
    if orcamento_servicos.present?
      for e in orcamento_servicos
        total += e.quantidade * e.servico.valor
      end
    end
    total
  end
end
