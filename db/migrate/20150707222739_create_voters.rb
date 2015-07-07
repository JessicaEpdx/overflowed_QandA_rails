class CreateVoters < ActiveRecord::Migration
  def change
    create_table :voters do |t|
      t.integer :voter_id
      t.integer :answer_id
    end
  end
end
