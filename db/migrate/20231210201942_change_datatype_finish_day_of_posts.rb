class ChangeDatatypeFinishDayOfPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :finish_day, :boolean
  end
end
