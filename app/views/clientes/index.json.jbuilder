json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nome, :endereco, :bairro, :cidade, :cep, :uf, :telefone, :celular, :data_nascimento, :email, :observacoes
  json.url cliente_url(cliente, format: :json)
end
