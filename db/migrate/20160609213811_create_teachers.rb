class CreateTeachers < ActiveRecord::Migration

	def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.timestamps 
    end
	end
end