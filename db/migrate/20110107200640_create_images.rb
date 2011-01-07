class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :name
      t.string :path
      t.string :width
      t.string :height

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
