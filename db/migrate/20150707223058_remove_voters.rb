class RemoveVoters < ActiveRecord::Migration
  def change
    drop_table :voters
    create_table :votes do |t|
      t.integer :user_id
      t.integer :answer_id
    end
  end
end
