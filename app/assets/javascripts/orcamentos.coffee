# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
verificaCliente = (val) ->
	if val == undefined || val == ""
		$("#infoCliente").hide()
	else
		$("#infoCliente").show()

verificaLocalDiferente = ($localDiferente) ->
	if $localDiferente.prop('checked')
			$('.endereco_diferente').show()
		else
			$('.endereco_diferente').hide()

atualizaCliente = (c) ->
	$("#clienteEndereco").html(c.endereco + ", " + c.complemento + " - " + c.bairro + " - " + c.cidade + " - " + c.uf)
	if c.telefone != "" && c.celular != ""
		telefones = c.telefone + " - " + c.celular
	else if c.telefone != ""
		telefones = c.telefone
	else
		telefones = c.celular
	$("#clienteTelefones").html(telefones)

montarLinhaTabela = (quantidade, e) ->
	return "<tr> \
				<td align='right'> \
					<input type='hidden' name='orcamento[orcamento_servicos_attributes][][quantidade]' value='" + quantidade + "'></input>" + 
					quantidade + "</td> \
				<td align='center'>" + e.unidade + "</td> \
				<td> \
					<input type='hidden' name='orcamento[orcamento_servicos_attributes][][servico_id]' value='" + e.id + "'></input>" + 
					e.nome + "</td> \
				<td align='right'>R$ " + parseFloat(e.valor).formatMoney(2, ",", ".") + "</td> \
				<td align='right'>R$ " + parseFloat(quantidade * e.valor).formatMoney(2, ",", ".") + "</td> \
				<td align='center'> \
					<a href='#' class='deletarServico btn btn-danger btn-xs' val='" + parseFloat(quantidade * e.valor) + "'> \
						<i class='glyphicon glyphicon-remove' title='Remover'></i> \
					</a> \
				</td> \
			</tr>"

$ ->
	val = $("#orcamento_cliente_id").val() 
	verificaCliente(val)
	verificaLocalDiferente($('#local_diferente'))

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

atualizarSubTotal = (novosubtotal) ->
	$("#hdnSubTotalServicos").val(novosubtotal)
	$("#subTotalServicos").html("R$ " + novosubtotal.formatMoney(2, ",", "."))

atualizarValorTotal = () ->
	$subtotal = $("#hdnSubTotalServicos")
	$total = $("#hdnTotalServicos")
	$desconto = $('#hdnDesconto')
	desconto_visivel = parseFloat($('#orcamento_desconto').val())
	$desconto.val(desconto_visivel)
	novototal = $subtotal.val() - $desconto.val() 
	$total.val(novototal)
	$("#totalServicos").html("R$ " + novototal.formatMoney(2, ",", "."))

incrementarTotal = (valor) ->
	$subtotal = $("#hdnSubTotalServicos")
	novosubtotal = parseFloat($subtotal.val()) + valor
	atualizarSubTotal(novosubtotal)
	atualizarValorTotal(novosubtotal)
	
decrementarTotal = (valor) ->
	$subtotal = $("#hdnSubTotalServicos")
	novosubtotal = parseFloat($subtotal.val()) - valor
	atualizarSubTotal(novosubtotal)
	atualizarValorTotal(novosubtotal)

$ ->
	$("#btnDialogAddServico").click (e) ->
		e.preventDefault()
		servico = $("#orcamento_servico_servico_id").val()
		quantidade = $("#orcamento_servico_quantidade").val()
			
		$.ajax
			url: "/servicos/" + servico + ".json"
			datatype: "json"
			success: (e, data, status, xhr) ->
				$("#orcamento_servico_servico_id").val("")
				$("#orcamento_servico_quantidade").val("")
				$("#tabelaServico").append(montarLinhaTabela(quantidade,e))
				incrementarTotal(e.valor * quantidade)
				
		$("#myModal").modal('hide')
		
$ ->
	$(document).on "click", "#tabelaServico .deletarServico", (e) ->
		e.preventDefault()
		valor = $(this).attr('val')
		decrementarTotal(valor)
		tr = $(this).closest('tr').remove()
		
$ ->
	$('#local_diferente').click () ->
		verificaLocalDiferente($(this))

		
$ ->    $("#orcamento_desconto").inputmask({mask: '999,99', numericInput: true, placeholder: " " })

$ ->
	$('#orcamento_desconto').change () ->
		atualizarValorTotal()