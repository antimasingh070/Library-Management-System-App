class UserBook < ApplicationRecord
  #it's refering user & book table
  belongs_to :user
  belongs_to :book
end
