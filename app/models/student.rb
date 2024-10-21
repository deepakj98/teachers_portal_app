class Student < ApplicationRecord
    validates :name, presence: true
    belongs_to :teacher
    has_many :student_records, dependent: :destroy
end
