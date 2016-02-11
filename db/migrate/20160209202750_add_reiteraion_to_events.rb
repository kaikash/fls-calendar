class AddReiteraionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :reiteration, :integer
  end
end
