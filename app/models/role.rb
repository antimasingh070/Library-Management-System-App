class Role < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :role
    has_many :book_roles
    has_many :books, through: :book_roles
  end