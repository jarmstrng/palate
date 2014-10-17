class User < ActiveRecord::Base
  has_secure_password

  has_many :event_wines
  has_many :events

  validates :email,     presence: true,
                        format: { :with => /\w+@\w+\.\w+/}
  validates :name,      presence: true

  validates :password,  length: { minimum: 3 },
                        confirmation: true,
                        presence: true
end
