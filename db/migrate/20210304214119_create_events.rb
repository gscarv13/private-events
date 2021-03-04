class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
