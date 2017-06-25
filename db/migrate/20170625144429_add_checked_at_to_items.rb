class AddCheckedAtToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :checked_at, :datetime
  end
end
