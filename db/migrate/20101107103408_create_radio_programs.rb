class CreateRadioPrograms < ActiveRecord::Migration
  def self.up
    create_table :radio_programs do |t|
      t.integer :user_id
      t.text :announcement
      t.string :name
      t.text :playlist

      t.timestamps
    end
  end

  def self.down
    drop_table :radio_programs
  end
end
