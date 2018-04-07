class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :slug
      t.string :decoded_url
      t.integer :access_count

      t.timestamps
    end
  end
end
