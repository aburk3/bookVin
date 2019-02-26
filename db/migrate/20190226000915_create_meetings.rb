class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :name
      t.integer :count
      t.datetime :date

      t.timestamps
    end
  end
end
