class Orcamento < ActiveRecord::Base
  belongs_to :cliente
  
  has_many :orcamento_servicos, :dependent => :destroy
  has_many :servicos, :through => :orcamento_servicos
  
  accepts_nested_attributes_for :orcamento_servicos
  
  validates :data, :cliente_id, :descricao, :forma_pagamento, :orcamento_servicos, presence: true
  
  paginates_per 10
  
  def valor_subtotal
    total = 0
    if orcamento_servicos.present?
      for e in orcamento_servicos
        total += e.quantidade * e.servico.valor
      end
    end
    total
  end
  
  def valor_total
    total = 0.0
    if orcamento_servicos.present?
      for e in orcamento_servicos
        total += e.quantidade * e.servico.valor
      end
    end
    total - (desconto.nil? ? 0.0 : desconto)
  end
end
