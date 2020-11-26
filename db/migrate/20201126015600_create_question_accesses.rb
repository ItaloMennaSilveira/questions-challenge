class CreateQuestionAccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :question_accesses do |t|
      t.timestamp :date
      t.integer :times_accessed
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
