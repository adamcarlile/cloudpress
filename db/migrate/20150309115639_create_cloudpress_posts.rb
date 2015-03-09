class CreateCloudpressPosts < ActiveRecord::Migration
  def change
    execute 'CREATE EXTENSION hstore'
    
    create_table :cloudpress_posts do |t|
      t.string :title
      t.string :slug
      t.string :file_path
      t.string :revision
      t.string :state
      t.text   :body
      t.json   :metadata
      t.datetime :publish_date
      t.timestamps null: false
    end

    add_index :cloudpress_posts, :state
    add_index :cloudpress_posts, :slug
    add_index :cloudpress_posts, :file_path
  end
end
