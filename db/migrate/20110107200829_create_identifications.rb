class CreateIdentifications < ActiveRecord::Migration
  def self.up
    create_table :identifications do |t|
      t.integer :tag_id
      t.integer :post_id

      t.timestamps
    end
  end

  def self.down
    drop_table :identifications
  end
end
