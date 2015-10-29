# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
atualiza = (curr) ->
	if curr == '1'
		$(".pessoa_juridica").show()
		$(".pessoa_juridica input").prop('disabled', false)
		
		$(".pessoa_fisica").hide()
		$(".pessoa_fisica input").prop('disabled', true)
	else
		$(".pessoa_fisica").show()
		$(".pessoa_fisica input").prop('disabled', false)
		
		$(".pessoa_juridica").hide()
		$(".pessoa_juridica input").prop('disabled', true)

$ ->
	$("#cep").inputmask('99999-999');
	$("#telefone").inputmask('(99) 9999-9999');
	$("#celular").inputmask('(99) 9999-9999');
	$("#campo_cpf").inputmask('999.999.999-99');
	$("#campo_cnpj").inputmask('99.999.999/9999-99');
	curr = $("#tipopessoa").val()
	atualiza(curr)

$ ->
	$("#consultacep").on "click", () -> 
		cep = $("#cep").val()
		$.ajax
			url: "/consultacep/" + cep
			datatype: "json"
			error: (e, xhr, status, error) ->
	    		$("#new_cliente").prepend '<div class="alert alert-danger" id="errocep" role="alert">Cep inválido</div>'
	    		$("#endereco").val("")
	    		$("#complemento").val("")
			    $("#bairro").val("")
			    $("#cidade").val("")
			    $("#uf").val("")
	    	success: (e, data, status, xhr) ->
			    	$("#endereco").val(e.logradouro)
			    	$("#errocep").remove()
			    	$("#bairro").val(e.bairro)
			    	$("#cidade").val(e.cidade)
			    	$("#uf").val(e.estado)
			    	$("#complemento").focus()
			    	$("#erroconsultacep").text ""

$ ->
	$("#tipopessoa").change (e) ->
		curr = e.target.value.toLowerCase()
		atualiza(curr)