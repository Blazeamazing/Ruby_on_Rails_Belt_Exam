class Formation < ActiveRecord::Base
  belongs_to :user, required: true
  has_many :warriors, dependent: :destroy
  has_many :users, through: :warriors, source: :user

  validates :name, presence: true, length: { minimum:5 }
  validates :description, presence: true, length: { minimum:10 }
end
