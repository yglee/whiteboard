class TeachingAssistantAssignment < ActiveRecord::Base
  belongs_to :user
  belongs_to :course

#  set_table_name "teaching_assistant_assignments"


end
