class AddArticleToCreateUsers < ActiveRecord::Migration
  def change
    add_column :users, :article, :text
  end
end
