class CreateApplauses < ActiveRecord::Migration[5.2]
  def change
    create_table :applauses do |t|
      t.references :user, foreign_key: true
      t.references :idea, foreign_key: true
      t.integer :count

      t.timestamps
      t.index [:user_id, :idea_id], unique: true
    end
  end
end
