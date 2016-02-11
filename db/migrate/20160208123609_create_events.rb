class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :user, index: true
      t.string :title, null: false
      t.date :date, null: false

      t.timestamps null: false
    end
  end
end
