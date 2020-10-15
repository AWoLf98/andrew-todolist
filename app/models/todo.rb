class Todo < ApplicationRecord
  has_many :lists, dependent: :destroy
  validates :title, presence: true,
            length: { minimum: 5, maximum: 50 }
end
