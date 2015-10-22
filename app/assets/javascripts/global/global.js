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

Number.prototype.formatMoney = function(c, d, t){
var n = this, 
    c = isNaN(c = Math.abs(c)) ? 2 : c, 
    d = d == undefined ? "." : d, 
    t = t == undefined ? "," : t, 
    s = n < 0 ? "-" : "", 
    i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", 
    j = (j = i.length) > 3 ? j % 3 : 0;
   return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
 };
 
 $(function() {
   $(".form-horizontal label").addClass("control-label col-sm-3");
   $(".form-horizontal input").addClass("form-control");
   $(".form-horizontal select").addClass("form-control");
   $(".form-horizontal textarea").addClass("form-control");
 });
	