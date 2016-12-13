class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string 	:file
      t.string 	:file_id
      t.string 	:file_filename
      t.integer :file_size
      t.string 	:file_content_type
      t.belongs_to :uploadable, polymorphic: true

      t.timestamps null: false
    end
    add_index :uploads, [:uploadable_id, :uploadable_type]
  end
end
