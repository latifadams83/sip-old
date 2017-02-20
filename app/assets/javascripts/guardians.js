$(document).ready(function() {
    $("#guardian_relation").on('change', function() {
      var relation = $("#guardian_relation").val();
      if (relation == "Father") {
        $("#fatherDetails").hide();
        $("#motherDetails").slideDown(300);
      } else if (relation == "Mother") {
        $("#motherDetails").hide();
        $("#fatherDetails").slideDown(300);
      } else if (relation == ""){
        $("#fatherDetails").hide();
        $("#motherDetails").hide();
      }else {
        $("#fatherDetails").show();
        $("#motherDetails").show();
      }
    });
});

//
// $(document).ready(function() {
//     $("input[name$='choose']").on('click', function() {
//         var guardian = $(this).val();
//
//         $("div.guardian-details").slideUp(300);
//         $("#form-" + guardian).slideDown(300);
//
//         $('#guardian_ward_id').autocomplete( {
//
//     	source: $('#guardian_ward_id').data('autocomplete-src'),
//     	minLength: 7
//   });
//     });
// });
