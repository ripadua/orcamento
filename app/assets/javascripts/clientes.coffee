# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
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
	    		$("#erroconsultacep").text "Cep inválido"
	    		$("#endereco").val("")
	    		$("#complemento").val("")
			    $("#bairro").val("")
			    $("#cidade").val("")
			    $("#uf").val("")
	    	success: (e, data, status, xhr) ->
			    	$("#endereco").val(e.logradouro)
			    	$("#bairro").val(e.bairro)
			    	$("#cidade").val(e.cidade)
			    	$("#uf").val(e.estado)
			    	$("#complemento").focus()
			    	$("#erroconsultacep").text ""

$ ->
	$("#menu-toggle").on "click", (e) ->
		e.preventDefault()
		$("#conteudo").toggleClass('ativo')

$ ->
	 $('[data-toggle="tooltip"]').tooltip();
	 
$ ->
	$("#tipopessoa").change (e) ->
		curr = e.target.value.toLowerCase()
		atualiza(curr)
			
atualiza = (curr) ->
	if curr == '1'
		$("#razao_social").show()
		$("#contato").show()
		$("#cnpj").show()
		$("#campo_razao_social").prop('disabled', false)
		$("#campo_contato").prop('disabled', false)
		$("#campo_cnpj").prop('disabled', false)
		
		$("#cpf").hide()
		$("#nome").hide()
		$("#campo_cpf").prop('disabled', true)
		$("#campo_nome").prop('disabled', true)
	else
		$("#nome").show()
		$("#cpf").show()
		$("#campo_nome").prop('disabled', false)
		$("#campo_cpf").prop('disabled', false)
		
		$("#cnpj").hide()
		$("#razao_social").hide()
		$("#contato").hide()
		$("#campo_cnpj").prop('disabled', true);
		$("#campo_razao_social").prop('disabled', true);
		$("#campo_contato").prop('disabled', true);