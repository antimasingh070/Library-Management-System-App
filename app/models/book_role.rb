class BookRole < ApplicationRecord
    belongs_to :book
    belongs_to :role
  end