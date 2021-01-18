class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :title
      t.string :text
      t.text :text1
      t.text :text2
      t.text :text3
      t.text :text4
      t.text :text5
      t.text :text6
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
