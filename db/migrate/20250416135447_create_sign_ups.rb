class CreateSignUps < ActiveRecord::Migration[8.0]
  def change
    create_table :sign_ups do |t|
      t.references :event_attended, null: false, foreign_key: { to_table: :events }
      t.references :attendee, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
