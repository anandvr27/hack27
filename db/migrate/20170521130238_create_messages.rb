class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :path
      t.string :value

      t.timestamps null: false
    end
  end
end
