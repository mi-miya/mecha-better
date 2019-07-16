class CreateIdeaReactions < ActiveRecord::Migration[5.2]
  def change
    create_table :idea_reactions do |t|
      t.references :user, foreign_key: true
      t.references :idea, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
