class User < ApplicationRecord
  # validates :email, uniqueness: true, presence: true, format: { with: /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/, message: "Adresse email s'il te plait" }
  # validates :encrypted_password, presence: true, length: {in: 6..20}
  # validates :description, length: {maximum: 250}, presence: true
  # validates :first_name, length: {in: 3..14}, presence: true
  # validates :last_name, length: {in: 3..14}, presence: true

  has_many :events, foreign_key: 'admin_id', class_name: 'Event' #pas sur de cette ligne 
  has_many :attendances
  has_many :events, through: :attendances

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
