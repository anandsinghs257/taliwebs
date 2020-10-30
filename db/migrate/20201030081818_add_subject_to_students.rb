class AddSubjectToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :subject, :string
  end
end
