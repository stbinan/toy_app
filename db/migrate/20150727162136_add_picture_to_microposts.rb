class AddPictureToMicroposts < ActiveRecord::Migration
  #def change
    #add_column :microposts, :picture, :string
  #end
  def self.up
    change_table :microposts do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :microposts, :picture
  end
end
