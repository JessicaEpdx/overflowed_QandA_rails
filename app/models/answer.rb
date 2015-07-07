class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  default_scope {order('score DESC')}

  validates_presence_of :description
end
