class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :subject_name
      t.integer :marks
      t.references :teacher

      t.timestamps
    end
  end
end
