class Student < ActiveRecord::Base
  # implement your Student model here

belongs_to :teacher


validates :email, uniqueness: true, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]{2,}\z/i }
validate :age_check

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
end
