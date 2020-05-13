class Attendance < ApplicationRecord
  after_create :new_attendance

  belongs_to :user
  belongs_to :event

  def new_attendance
    UserMailer.new_attendance(self).deliver_now
  end
end
