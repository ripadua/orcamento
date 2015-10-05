# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$("#cep").inputmask('99999-999');
	$("#telefone").inputmask('(99) 9999-9999');
	$("#celular").inputmask('(99) 9999-9999');

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