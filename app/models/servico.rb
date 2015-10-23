class Servico < ActiveRecord::Base
    
    validates :nome, presence: true, uniqueness: true
    validates :unidade, :valor, presence: true
    
    has_many :orcamento_servicos
    has_many :orcamentos, :through => :orcamento_servicos, :dependent => :restrict_with_error
    
    paginates_per 10
end
