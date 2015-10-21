class Orcamento < ActiveRecord::Base
  belongs_to :cliente
  
  has_many :orcamento_servicos
  has_many :servicos, :through => :orcamento_servicos
end
