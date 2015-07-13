class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  belongs_to :category

  validates_presence_of :title
  validates_presence_of :description


  def self.Search(searchString)
    result = self.search(searchString)
    if result.kind_of?(Array)
      return result
    else
      return []
    end
  end

end
