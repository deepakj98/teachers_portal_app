class Teacher < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true,
                      format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address"}
    has_many :students, dependent: :destroy
end
