class CreateTweetSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :tweet_searches do |t|
      t.string :keywords
      t.integer :user_id

      t.timestamps
    end
  end
end
