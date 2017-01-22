class Searchstudent < ApplicationRecord

  def students
    @students ||= find_students
  end

  def find_students
    Student.where(:conditions => conditions)
  end

  def placed_id_conditions
    ["placed_id LIKE ?", "%#{placed_id}%"] unless placed_id.blank?
  end

  def programme_conditions
    ["programme_id = ?", programme_id] unless programme_id.blank?
  end

  def level_conditions
    ["level_id = ?", level_id] unless level_id.blank?
  end

  def badge_conditions
    ["badge_id = ?", badge_id] unless badge_id.blank?
  end

  def conditions
    [conditions_clauses.join('AND'), *conditions_options]
  end

  def conditions_clauses
    conditions_parts.map{|condition| condition.first}
  end

  def conditions_parts
    methods.grep(/_condition$/).map { |m| send(m) }.compact
  end
end
