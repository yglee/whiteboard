class CreateTeachingAssistantAssigments < ActiveRecord::Migration
  def change
	 create_table :teaching_assistant_assignments do |t|
      t.integer :user_id
      t.integer :course_id
      
 
      t.timestamps
    end
  end
end
