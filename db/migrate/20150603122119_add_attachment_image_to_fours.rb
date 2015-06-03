class AddAttachmentImageToFours < ActiveRecord::Migration
  def self.up
    change_table :fours do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :image_news, :image
  end
end
