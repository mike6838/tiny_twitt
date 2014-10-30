class CreateTwits < ActiveRecord::Migration
  def change
    create_table :twits do |t|
      t.string :content
      t.belongs_to :user

      t.timestamps
    end
  end
end
