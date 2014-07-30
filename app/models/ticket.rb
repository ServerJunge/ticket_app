class Ticket < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :client, presence: true
end
