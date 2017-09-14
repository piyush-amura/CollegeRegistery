require_relative 'colleges'
require_relative 'students'
require_relative 'courses'
require_relative 'teachers'
class App

  def launch!
    ch = 0
    until ch == '4' 
      puts '------ college info portal ------'
      menu
      ch = gets.chomp
      process_choice(ch)
    end
  end

  def process_choice(ch)
    case ch
    when '1' then college_search
    when '2' then course_search
    when '3' then student_search
    when '4' then puts 'adios'
    else
      puts 'invalid input !!'
    end
  end

  def college_search
    # college_list = College.all.map {|a| a[1]}
    college_list = College.all
    puts 'Enter College Name : '
    clg = gets.chomp
    college = college_list.find{|college| college[1].include?(clg)}
    college.nil? ? not_found_message : college_search_result(college) 
  end
  
  def course_search
    
  end

  def student_search

  end

  def menu
    puts '1. Search College'
    puts '2. Search Courses'
    puts '3. Search Student'
    puts '4. Quit'
    puts 'Enter Your choice'
  end

  def college_search_result(college)
    puts '--------  courses found in college -----------'
    courses = Course.all.find_all {|course| college[2].include?(course[0]) }
    courses.each {|c| puts c[1] } 
  end

  def not_found_message
    puts 'not found'
  end  
end

App.new.launch!