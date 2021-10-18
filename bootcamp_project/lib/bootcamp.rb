class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new { |h, k| h[k] = [] }
  end
  attr_reader :name, :slogan, :teachers, :students

  def hire(tea)
    @teachers << tea
  end

  def enroll(stu)
    if @students.length < @student_capacity
      @students << stu
      true
    else
      false
    end
  end

  def enrolled?(stu)
    @students.include?(stu)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(stu, grade)
    if enrolled?(stu)
      @grades[stu] << grade
      true
    else
      false
    end
  end

  def num_grades(stu)
    @grades[stu].length
  end

  def average_grade(stu)
    return nil if num_grades(stu) == 0 || !enrolled?(stu)
    sum = @grades[stu].sum / num_grades(stu)
  end
end