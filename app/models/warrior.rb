class Warrior < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :formation, required: true
end
