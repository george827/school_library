class Classroom
  attr_accessor :lable, :students

  def initialize(lable)
    @lable = lable
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
