class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.references   :admin_user
      t.string       :serial_number
      t.string       :make
      t.string       :model
      t.integer      :year

      t.timestamps
    end
  end
end
