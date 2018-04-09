class ChangeDefaultForUrlsAccessCount < ActiveRecord::Migration[5.1]
  def change
    change_column :urls, :access_count, :integer, :default => 0
  end
end
