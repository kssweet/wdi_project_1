class AddArticlesToCreateUsers < ActiveRecord::Migration
  def change
        add_column :users, :article, :text
  create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.text   :article

      t.timestamps
    end
  end
end
