class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :query
      t.text :solution

      t.timestamps
    end
  end
end
