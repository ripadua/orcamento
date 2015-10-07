# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	$("#valor").inputmask({mask: '[9]99,99', greedy: false, numericInput: true })
