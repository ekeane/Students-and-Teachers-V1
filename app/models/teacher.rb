class Teacher < ActiveRecord::Base
  # implement your Student model here

has_many :students
 
validate :proper_hire?  
  
end


private 

def proper_hire?
	if self.hire_date < self.retirement_date
	else self.hire_date > self.retirement_date && self.hire_date && self.retirement_date && self.retirement_date <= Date.today
		errors.add(:retirement_date, "You must be hired first before you can retire!")
	end 
end 