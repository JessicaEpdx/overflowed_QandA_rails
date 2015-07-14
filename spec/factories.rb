FactoryGirl.define do
  factory(:user) do
    username('billyjewel')
    cycle_length(58)
    bio("I love my period. It makes me happy, then sad.")
    email("iheartperiods@gmail.com")
    preference("Tampons")
    password("bigtampons")
    password_confirmation("bigtampons")
  end

end
