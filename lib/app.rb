require_relative 'colleges'
require_relative 'students'
require_relative 'courses'
require_relative 'teachers'
# Class App provides interface to the application
#
# @author Piyush Wani <piyush.wani@amuratech.com>
#
class App
  # launches the application
  #
  #
  # @return nil
  #
  def launch!
    ch = nil
    until ch == '8'
      puts '------ college info portal ------'
      menu
      ch = gets.chomp
      process_choice(ch)
    end
  end

  # method that drives the flow of the code according to the user choice
  #
  # @param [String] ch choice from user
  #
  # @return nil
  #
  def process_choice(ch)
    case ch
    when '1' then college_search
    when '2' then course_search
    when '3' then student_search
    when '4' then add_college
    when '5' then add_course
    when '6' then add_teacher
    when '7' then add_student
    when '8' then puts 'adios'
    else
      puts 'invalid input !!'
    end
  end

  # method for college search logic
  #
  #
  # @return [College] Object of College class
  #
  def college_search
    college_list = College.all
    puts 'Enter College Name : '
    clg = gets.chomp
    college = college_list.find { |c| c[1].include?(clg) }
    college.nil? ? not_found_message : college_search_result(college)
  end
  
  # method for course search
  #
  #
  # @return [Course] Object of Course class
  #
  def course_search
    course_list = Course.all
    puts 'Enter Course Name : '
    c = gets.chomp
    course = course_list.find { |crse| crse[1].include?(c) }
    course.nil? ? not_found_message : course_search_result(course)
  end

  # method for student search
  #
  #
  # @return [Student] Object of Student class
  #
  def student_search
    student_list = Student.all
    puts 'Enter Student Name : '
    c = gets.chomp
    student = student_list.find { |s| s[1].include?(c) }
    student.nil? ? not_found_message : student_search_result(student)
  end

  # method that provides interface to add the college in the registery
  #
  #
  # @return [Nil]
  #
  def add_college
    puts '---- Add a college to the registery ----'
    puts 'College-Name :-'
    college_name = gets.chomp
    college = College.new(college_name)
    CSV.open('./colleges.csv', 'a+') do |c|
      c << [college.id, college.name, college.courses]
    end
    puts 'college added'
  end

  # method that provides interface to add the college in the registery
  #
  #
  # @return [Nil]
  #
  def add_course
    puts '---- Add a course to the registery ----'
    puts 'Course-Name :-'
    course_name = gets.chomp
    course = Course.new(course_name)
    CSV.open('./courses.csv', 'a+') do |c|
      c << [course.id, course.name]
    end
    puts 'course added'
  end

  # method that provides interface to add the teachers in the registery
  #
  #
  # @return [Nil]
  #
  def add_teacher
    puts '---- Add a Teacher to the registery ----'
    puts 'Name :-'
    name = gets.chomp
    puts 'College Name'
    clg = gets.chomp
    college_list = College.all
    college = college_list.find { |c| c[1].include?(clg) }
    teacher = Teacher.new(name, college[0])
    CSV.open('./teachers.csv', 'a+') do |t|
      t << [teacher.id, teacher.name, teacher.college_id, teacher.courses]
    end
    puts 'teacher added'
  end
  
  # method that provides interface to add the teachers in the registery
  #
  #
  # @return [Nil]
  #
  def add_student
    puts '---- Add a Student to the registery ----'
    puts 'Name :-'
    name = gets.chomp
    puts 'College Name'
    clg = gets.chomp
    college_list = College.all
    college = college_list.find { |c| c[1].include?(clg) }
    puts 'Course Name'
    crse = gets.chomp
    course_list = Course.all
    course = course_list.find { |c| c[1].include?(crse) }
    student = Student.new(name, college[0], course[0])
    # p student
    CSV.open('./students.csv', 'a+') do |t|
      t << [student.id, student.name, student.college_id, student.course_id]
    end
    puts 'student added'
  end

  # method that display menu to the user
  #
  #
  # @return [nil]
  # 
  def menu
    puts '1. Search College'
    puts '2. Search Courses'
    puts '3. Search Student'
    puts '4. Add College'
    puts '5. Add Course'
    puts '6. Add Teacher'
    puts '7. Add Student'
    puts '8. Quit'
    puts 'Enter Your choice'
  end

  # method that generate results from college search and presnts it back to the
  # user
  #
  # @param [Array] college Array of the college object from the csv
  #
  # @return [Nil]
  #
  def college_search_result(college)
    puts '--------  courses found in college -----------'
    courses = Course.all.find_all { |course| college[2].include?(course[0]) }
    courses.each { |c| puts c[1] }
    puts "----------------------------------------------\n\n"
  end

  # method that generate results from course search and presnts it back to the
  # user
  #
  # @param [Array] course Array of the course object from the csv
  #
  # @return [Nil]
  #
  def course_search_result(course)
    puts '------- College list that offers this course -------'
    colleges = College.all.find_all { |college| college[2].include?(course[0]) }
    colleges.each { |clg| puts clg[1] }
    puts "----------------------------------------------------\n\n"
  end

  # method that generate results from course search and presnts it back to the
  # user
  #
  # @param [Array] student Array of the student object from the csv
  #
  # @return [Nil]
  #
  def student_search_result(student)
    puts '------- Student Info -------'
    puts "Name:- #{student[1]}"
    college = College.all.find { |clg| clg[0] == student[2] }
    puts "college :- #{college[1]}"
    course = Course.all.find { |c| c[0] == student[2] }
    puts "course :- #{course[1]}"
    puts "----------------------------\n\n"
  end

  # method that print out not found message
  #
  #
  # @return [Nil]
  #
  def not_found_message
    puts 'not found'
  end
end
