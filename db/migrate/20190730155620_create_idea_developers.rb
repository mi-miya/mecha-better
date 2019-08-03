class CreateIdeaDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :idea_developers do |t|
      t.references :user, foreign_key: true
      t.references :idea, foreign_key: true
      t.boolean :develop, default: false

      t.timestamps
    end
  end
end
