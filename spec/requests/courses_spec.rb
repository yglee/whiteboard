require "spec_helper"

describe "courses" do

   before do
   visit('/')
   @user = FactoryGirl.create(:student_sam)
   @semester = AcademicCalendar.current_semester()
   @year = Date.today.year
   login_with_oauth @user
   click_link "#{@semester} #{@year}" " Courses"
  end

  context "current courses" do

    it "renders current courses page" do
      page.should have_content("#{@semester} #{@year}" " Courses")
      page.should have_selector("input#filterBoxOne")
      page.should have_link("course selections")
    end

    it "defaults to a listing of all courses in the semester" do
        page.should have_selector("#courses_for_a_semester")
    end

    it "toggles to a visual representation of courses" do
      click_link "Show courses by minis"
      page.should have_selector("#courses_by_length")
    end

  end

   context "all courses" do
    it 'renders all courses' do
      click_link "Courses"
      page.should have_content("All Courses")
      page.should have_link("See current semester")
   end

   end

   context "Teaching assistant in course page " do
     before do
       @ta= FactoryGirl.create(:student_ta_user)
       @faculty = FactoryGirl.create(:faculty_frank_user)

       login_with_oauth @faculty
       @course = FactoryGirl.create(:fse)
       @faculty_assignment = FactoryGirl.create(:faculty_assignment, :course_id => @course.id,
                                                :user_id => @faculty.id)
       @ta_assignment = FactoryGirl.create(:ta_assignment, :course_id => @course.id,
                                           :user_id => @ta.id)
     end

     it "Show Teaching assistants in course page" do
       click_link "Courses"
       click_link "Foundations of Software Engineering"
       page.should have_content("Teaching Assistants")
       page.should have_content("Student TA")
     end

     it "Able to add Teaching assistant to a course " do
       click_link "Courses"
       click_link "Foundations of Software Engineering"
       click_link "Edit"
       page.should have_content("Add a teaching assistant")
       click_link "Add a teaching assistant"
     end

   end


end