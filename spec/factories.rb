FactoryGirl.define do
  factory :user do
    email('test@gmail.com')
    password('123456')
  end

  factory :worker do
    email('test1@gmail.com')
    password('123456')
  end

  factory :job do
    user
    title("Broken Sink")
    description("The sink is clogged.")
  end
end
