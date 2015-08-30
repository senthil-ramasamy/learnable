FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "sun.#{n}@meg.com" }
    sequence(:name) { |n| "sun.#{n}.meg" }
    password "12345678"
  end

  factory :enrollment do
    association :user
    association :course
  end

  factory :course do
    title "All About Interwebs"
    subject "Interwebs"
    description "So much interwebs info oh wow."
    association :user
  end

  factory :quiz do
    sequence(:title) { |n| "Quiz #{n}"}
    association :course
  end

  factory :question do
    sequence(:text) { |n| "Is this a question #{n}" }
    association :quiz
  end

  factory :answer do
    sequence(:text) { |n| "This is a wrong answer #{n}" }
    correct false
    association :question
  end

  factory :assignment do
    sequence(:title) { |n| "Interwebs Part #{ n }" }
    importance "This is very important"
    goals "There are three goals"
    association :course
  end

  factory :video_element, class: Element do
    sequence(:title) { |n| "Video Element #{ n }"}
    sequence(:citation) { |n| "Source #{ n }"}
    url '<iframe width="560" height="315" src="//www.youtube.com/embed/LlUdlWi7MIQ" frameborder="0" allowfullscreen></iframe>'
    type_id 4
    association :assignment
  end

  factory :text_element, class: Element do
    sequence(:title) { |n| "Text Element #{ n }"}
    sequence(:citation) { |n| "Source #{ n }"}
    content "It is highly recommended that you have one factory for each class that provides the simplest set of attributes necessary to create an instance of that class. If you're creating ActiveRecord objects, that means that you should only provide attributes that are required through `validations` and that do not have defaults. Other factories can be created through inheritance to cover common scenarios for each class."
    type_id 1
    association :assignment
  end

  factory :tipbox_element, class: Element do
    sequence(:title) { |n| "Tipbox Element #{ n }"}
    sequence(:citation) { |n| "Source #{ n }"}
    type_id 2
    content "Attempting to define multiple factories with the same name will raise an error."
    association :assignment
  end

  factory :markdown_element, class: Element do
    sequence(:title) { |n| "Markdown Element #{ n }"}
    sequence(:citation) { |n| "Source #{ n }"}
    type_id 5
    content "Attempting to **define** `multiple factories` with the *same* name will raise an error."
    association :assignment
  end

  factory :image_element, class: Element do
    sequence(:title) { |n| "Image Element #{ n }"}
    sequence(:citation) { |n| "Source #{ n }"}
    type_id 3
    url "http://www.camerareviewlabs.com/wp-content/uploads/2012/01/nikon-d3100-front.jpg"
    association :assignment
  end
end
