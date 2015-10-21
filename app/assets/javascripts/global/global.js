$(function() {
  $('#loading-indicator').hide();  // hide it initially.
  $(document)  
    .ajaxStart(function() {
      $('#loading-indicator').show(); // show on any Ajax event.
    })
    .ajaxStop(function() {
      $('#loading-indicator').hide(); // hide it when it is done.
  });
  
  $('[data-toggle="tooltip"]').tooltip();
  
  $("#menu-toggle").click(function(e) {
		e.preventDefault()
		$("#conteudo").toggleClass('ativo')
  });
});
	