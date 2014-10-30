class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      # t.belongs_to :user, :class_name => "User", :foreign_key => :user_id
      # t.belongs_to :follower, :class_name => "User", :foreign_key => :user_id
      t.integer :user
      t.integer :follower

      t.timestamps
    end
  end
end
