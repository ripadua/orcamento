# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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