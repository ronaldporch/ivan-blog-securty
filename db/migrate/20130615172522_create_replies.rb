class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :body
      t.refereces :comment

      t.timestamps
    end
  end
end
