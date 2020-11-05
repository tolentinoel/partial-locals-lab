# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  # -when it receives a search query
  # returns all students whose names contain the given string (FAILED - 7)
  # renders the results with a partial (FAILED - 8)

  def self.search(query)
    if query.present?
      where('name LIKE ?', "%#{query}%")
    else
      self.all
    end
  end
  
end
