class AddRequesterToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :requester, :string
  end
end
