class CreateStudentRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :student_records do |t|
      t.string :subject
      t.integer :marks
      t.references :student

      t.timestamps
    end
  end
end
