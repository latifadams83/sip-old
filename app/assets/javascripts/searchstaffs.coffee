# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  departments = $('#searchstaff_staff_department_id').html()
  $('#searchstaff_staff_category_id').change ->
    category = $('#searchstaff_staff_category_id :selected').text()
    options = $(departments).filter("optgroup[label='#{category}']").html()
    if options
      $('#searchstaff_staff_department_id').html(options)
      $('#searchstaff_department_id').parent().show()
    else
      $('#searchstaff_staff_department_id').empty()
      $('#searchstaff_staff_department_id').parent().hide()
