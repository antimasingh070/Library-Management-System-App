class Book < ApplicationRecord
  #many to many relation between book & user. 
  #validate book by their title  & book title should be min 2 max 100.
  
    has_many :user_books
    has_many :users, through: :user_books
    validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  
end
