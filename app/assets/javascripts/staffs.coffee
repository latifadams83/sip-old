jQuery ->
  departments = $('#staff_department_id').html()
  $('#staff_category_id').change ->
    category = $('#staff_category_id :selected').text()
    options = $(departments).filter("optgroup[label='#{category}']").html()
    if options
      $('#staff_department_id').html(options)
      $('#staff_department_id').parent().show()
    else
      $('#staff_department_id').empty()
      $('#staff_department_id').parent().hide()
