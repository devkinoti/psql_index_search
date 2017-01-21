class AddLowerIndexesToStudents < ActiveRecord::Migration[5.0]
  def up
  	execute %{
  		create index 
  			students_lower_last_name
  		on
  			students (lower(last_name) varchar_pattern_ops)
  	}

  	execute %{
  		create index 
  			students_lower_first_name
  		on 
  			students (lower(first_name) varchar_pattern_ops)
  	}

  	execute %{
  		create index 
  			students_lower_email
  		on 
  			students(lower(email))
  	}
  end


  def down
  	remove_index :students, name: "students_lower_last_name"
  	remove_index :students, name: "students_lower_first_name"
  	remove_index :students, name: "students_lower_email"
  end
end
