$(document).ready(function() {
    $("input[name$='choose']").click(function() {
        var guardian = $(this).val();

        $("div.guardian-details").slideUp(1000);
        $("#form-" + guardian).slideDown();
    });
});
