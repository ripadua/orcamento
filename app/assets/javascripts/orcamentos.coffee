# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
verificaCliente = (val) ->
	if val == ""
		$("#infoCliente").hide()
	else
		$("#infoCliente").show()

atualizaCliente = (c) ->
	$("#clienteEndereco").html(c.endereco + ", " + c.complemento + " - " + c.bairro + " - " + c.cidade + " - " + c.uf)
	if c.telefone != "" && c.celular != ""
		telefones = c.telefone + " - " + c.celular
	else if c.telefone != ""
		telefones = c.telefone
	else
		telefones = c.celular
	$("#clienteTelefones").html(telefones)

montarLinhaTabela = (quantidade, os) ->
	return "<tr><td align='right'><input type='hidden' name='orcamento_servicos[][quantidade]' value='" + quantidade + "'></input>" + quantidade + "</td><td align='center'>" + os.servico.unidade + "</td><td><input type='hidden' name='orcamento_servicos[][servico_id]' value='" + os.servico.id + "'></input>" + os.servico.nome + "</td><td align='right'>R$ " + parseFloat(os.servico.valor).formatMoney(2, ",", ".") + "</td><td align='right'>R$ " + parseFloat(quantidade * os.servico.valor).formatMoney(2, ",", ".") + "</td></tr>"

$ ->
	val = $("#orcamento_cliente_id").val() 
	verificaCliente(val)

	$("#orcamento_cliente_id").change (e) -> 
		val = e.target.value.toLowerCase()
		verificaCliente(val)
		if val != ""
			$.ajax
				url: "/clientes/" + val + ".json"
				datatype: "json"
				error: (e, xhr, status, error) ->
					$("#clienteEndereco").html("")
					$("#clienteTelefones").html("")
				success: (e, data, status, xhr) ->
				    	atualizaCliente(e)

$ ->
	$("#orcamento_servico_servico_id").change (e) ->
		curr = e.target.value.toLowerCase()
		$.ajax
			url: "/servicos/" + curr + ".json"
			datatype: "json"
			success: (e, data, status, xhr) ->
				$("#unidade").html(e.unidade)

$ ->
	$("#btnDialogAddServico").click (e) ->
		e.preventDefault()
		servico = $("#orcamento_servico_servico_id").val()
		quantidade = $("#orcamento_servico_quantidade").val()
		data = $("#orcamento_data").val()
		cliente_id = $("#orcamento_cliente_id").val()
		descricao = $("#orcamento_descricao").val()
		forma_pagamento = $("#orcamento_forma_pagamento").val()
		observacoes = $("#orcamento_observacoes").val()
		validade = $("#orcamento_validade").val()
			
		$.ajax
			url: "/orcamentos/add_servico"
			method: "POST"
			datatype: "json"
			data: {"orcamento": {"data":data, "cliente_id":cliente_id, "descricao":descricao, "forma_pagamento":forma_pagamento, "observacoes":observacoes, "validade":validade}, "orcamento_servico": {"servico_id": servico, "quantidade":quantidade}}
			success: (e, data, status, xhr) ->
				$("#orcamento_servico_servico_id").val("")
				$("#orcamento_servico_quantidade").val("")
				os = e.orcamento_servicos[0]
				$("#tabelaServico").append(montarLinhaTabela(quantidade,os))
				$("#totalServicos").html(os.valor_total)
				#alert(e)
				
		$("#myModal").modal('hide')
		
