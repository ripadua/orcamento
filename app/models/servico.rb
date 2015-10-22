class Servico < ActiveRecord::Base
    
    has_many :orcamento_servicos
    has_many :orcamentos, :through => :orcamento_servicos
    
    paginates_per 10
end
