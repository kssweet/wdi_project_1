class DropNewsStoriesTable < ActiveRecord::Migration
  def up
    drop_table :newsstories
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
