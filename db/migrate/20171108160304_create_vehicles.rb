class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles, id: false do |t|
      t.string       :serial_number, primary_key: true
      t.references   :admin_user
      t.string       :make
      t.string       :model
      t.integer      :year

      t.timestamps
    end
  end
end
