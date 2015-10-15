json.array!(@orcamentos) do |orcamento|
  json.extract! orcamento, :id, :data, :cliente_id, :descricao, :forma_pagamento, :observacoes, :validade
  json.url orcamento_url(orcamento, format: :json)
end
