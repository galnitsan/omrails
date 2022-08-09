class AddUrlToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :url, :string
  end
end
