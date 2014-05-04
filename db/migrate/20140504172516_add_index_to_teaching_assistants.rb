class AddIndexToTeachingAssistants < ActiveRecord::Migration
  def change
  add_index :teaching_assistant_assignments, :user_id
  add_index :teaching_assistant_assignments, :course_id
  end
end
