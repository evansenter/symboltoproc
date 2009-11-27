class DropCommentsTableForNow < ActiveRecord::Migration
  def self.up
    drop_table :comments
  end

  def self.down
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.belongs_to :post

      t.timestamps
    end
  end
end
