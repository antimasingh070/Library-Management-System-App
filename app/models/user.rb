class User < ApplicationRecord
    #many to many relation between book & user. 
    #validate user by their first name,last name & email id.

    before_save { self.email = email.downcase }
    has_many :user_books
    has_many :books, through: :user_books
    validates :first_name, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { minimum: 3, maximum: 25 }
    validates :last_name, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { maximum: 105 },
                        format: { with: VALID_EMAIL_REGEX }
    has_secure_password

 
      
end
