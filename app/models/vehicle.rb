class Vehicle < ApplicationRecord
  belongs_to :admin_user
  self.primary_key = :serial_number

  def name
    serial_number
  end
end
