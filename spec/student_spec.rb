require 'rspec'
require './student'
require './classroom'

describe Student do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new(15, 'John Doe', classroom) }

  context '#classroom=' do
    it 'should add the student to the classroom students list' do
      expect(classroom.students).to_not include(student)
      student.classroom = classroom
      expect(classroom.students).to include(student)
    end

    it 'should not add the student twice to the classroom students list' do
      student.classroom = classroom
      expect(classroom.students.count(student)).to eq(1)
      student.classroom = classroom
      expect(classroom.students.count(student)).to eq(1)
    end
  end

  context '#play_hooky' do
    it 'should return the correct string' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  context '#to_json' do
    it 'should return a JSON string with the correct keys' do
      json_string = student.to_json
      expect(json_string).to include('type')
      expect(json_string).to include('id')
      expect(json_string).to include('name')
      expect(json_string).to include('age')
      expect(json_string).to include('classroom')
      expect(json_string).to include('parent_permission')
    end
  end
end
