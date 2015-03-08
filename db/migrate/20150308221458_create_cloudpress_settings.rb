class CreateCloudpressSettings < ActiveRecord::Migration
  def change
    create_table :cloudpress_settings do |t|
      t.string :key
      t.string :value
      t.timestamps null: false
    end
  end
end
