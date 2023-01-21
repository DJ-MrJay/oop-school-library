require_relative '../classroom'
require_relative '../student'

describe Classroom do
  before :each do
    @new_classroom = Classroom.new('grade')
  end
  it 'Inserted data should match attribute' do
    expect(@new_classroom.label).to eql('grade')
  end

  it 'Student array should be populated' do
    new_student = Student.new('7', 33, 'Selma')

    @new_classroom.add_student(new_student)

    expect(@new_classroom.students.length).to eql 1
  end
end
