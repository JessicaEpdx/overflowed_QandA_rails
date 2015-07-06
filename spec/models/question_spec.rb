describe Question do
  it {should validate_presence_of :title}
  it {should validate_presence_of :description}

  it {should belong_to :user}
  it {should have_many :answers}
end
