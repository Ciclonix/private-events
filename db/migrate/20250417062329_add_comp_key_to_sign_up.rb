class AddCompKeyToSignUp < ActiveRecord::Migration[8.0]
  def change
    add_index :sign_ups, [ :event_attended_id, :attendee_id ], unique: true
  end
end
