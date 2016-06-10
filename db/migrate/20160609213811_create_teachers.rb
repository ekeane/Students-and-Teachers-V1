class CreateTeachers < ActiveRecord::Migration

	def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.date :last_student_added_at
      t.date :retirement_date
      t.date :hire_date
      t.timestamps 
    end
	end
end