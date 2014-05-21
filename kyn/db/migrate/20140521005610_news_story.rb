class NewsStory < ActiveRecord::Migration
  def change
  create_table :newsstories do |t|
      t.string :title
      t.text   :article

      t.timestamps
    end
  end
end
