class Student < ActiveRecord::Base
  # implement your Student model here

belongs_to :teacher

validates :email, uniqueness: true, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]{2,}\z/i }
validate :age_check

before_save :last_student_added_at, if: :teacher
after_save :teacher_retired?

	def name 
		self.first_name + " " + self.last_name 
	end 


	def age
	  Date.today.year - self.birthday.year - ((Date.today.month > self.birthday.month || (Date.today.month == self.birthday.month && Date.today.day >= self.birthday.day)) ? 0 : 1) 
	end

	private

	def age_check
		if age <= 3 
			errors.add(:age, "Too young!")    #reference symbol
		end
	end

	private

	def teacher_retired?
		if self.teacher.hire_date < self.teacher.retirement_date
			self.teacher.teacher_id = nil
		end 
	end 


end
