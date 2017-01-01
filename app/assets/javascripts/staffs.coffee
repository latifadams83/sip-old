jQuery ->
  departments = $('#staff_staff_department_id').html()
  grades = $('#staff_staff_grade_id').html()
  positions = $('#staff_staff_position_id').html()
  $('#staff_staff_category_id').change ->
    category = $('#staff_staff_category_id :selected').text()
    deptOptions = $(departments).filter("optgroup[label='#{category}']").html()
    gradeOptions = $(grades).filter("optgroup[label='#{category}']").html()
    positionOptions = $(positions).filter("optgroup[label='#{category}']").html()
    if deptOptions || gradeOptions || positionOptions
      $('#staff_staff_department_id').html(deptOptions)
      $('#staff_staff_department_id').parent().show()
      $('#staff_staff_grade_id').html(gradeOptions)
      $('#staff_staff_grade_id').parent().show()
      $('#staff_staff_position_id').html(positionOptions)
      $('#staff_staff_position_id').parent().show()
    else
      $('#staff_staff_department_id').empty()
      $('#staff_staff_department_id').parent().hide()
      $('#staff_staff_grade_id').empty()
      $('#staff_staff_grade_id').parent().hide()
      $('#staff_staff_position_id').empty()
      $('#staff_staff_position_id').parent().hide()
