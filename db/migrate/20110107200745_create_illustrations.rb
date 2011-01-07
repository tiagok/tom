class CreateIllustrations < ActiveRecord::Migration
  def self.up
    create_table :illustrations do |t|
      t.integer :image_id
      t.integer :post_id

      t.timestamps
    end
  end

  def self.down
    drop_table :illustrations
  end
end
