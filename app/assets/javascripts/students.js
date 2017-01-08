
$( ".datepicker" ).datepicker({
  dateFormat: "dd-mm-yy", changeYear: true, changeMonth: true,showAnim: "fold", showButtonPanel: true

});
function ShowHideDiv() {
  var chkYes = document.getElementById("chkYes");
  var dvPassport = document.getElementById("dvUser");
  dvPassport.style.display = chkYes.checked ? "block" : "none";
};
