module StaffsHelper

  def find_role_id()
    return Role.where({:name => "staff"}).first.id
  end
end
