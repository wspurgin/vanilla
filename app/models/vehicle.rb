class Vehicle < ApplicationRecord
  belongs_to :admin_user

  def name
    serial_number
  end
end
