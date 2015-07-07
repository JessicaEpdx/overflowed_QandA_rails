class RemoveScoreFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :score
    add_column :answers, :score, :integer, :default => 0
  end
end
