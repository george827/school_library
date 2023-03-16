require 'rspec'
require './classroom'
require './student'

describe Classroom do
  let(:classroom) { Classroom.new('Math') }
  let(:student1) { Student.new(18, 'John Doe', true) }
  let(:student2) { Student.new(18, 'Jane Doe', true) }

  context '#initialize' do
    it 'should create a new Classroom instance with a lable' do
      expect(classroom).to be_an_instance_of(Classroom)
      expect(classroom.lable).to eq('Math')
    end

    it 'should initialize an empty array for students' do
      expect(classroom.students).to eq([])
    end
  end

  context '#add_student' do
    it 'should add a student to the students array' do
      classroom.add_student(student1)
      expect(classroom.students).to include(student1)
    end

    it 'should set the student\'s classroom attribute to the current classroom' do
      classroom.add_student(student1)
      expect(student1.classroom).to eq(classroom)
    end

    it 'should not add the same student to the students array twice' do
      classroom.add_student(student1)
      expect do
        classroom.add_student(student1)
      end.to change { classroom.students.count }.by(1)
    end
  end
end
