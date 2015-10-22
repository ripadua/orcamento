class OrcamentoServico < ActiveRecord::Base
    belongs_to :orcamento
    belongs_to :servico
end
