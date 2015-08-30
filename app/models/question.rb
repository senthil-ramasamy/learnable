class Question < ActiveRecord::Base
  belongs_to :quiz
  has_many :answers, dependent: :destroy
  validates :quiz, :text, presence: true
  validates :text, length: { minimum: 5 }
  default_scope { order('created_at ASC') }

  def correct_answer
    self.answers.where(correct: true).first || self.answers.build(correct: true)
  end

  def correct_answer=(value)
    self.correct_answer.delete
    self.answers << Answer.new(text: value, correct: true)
  end

  def wrong_answers
    wrong = []
    if self.answers.where(correct: false).empty?
      3.times { wrong << self.answers.build }
      return wrong
    else
      return self.answers.where(correct: false)
    end
  end

  def wrong_answers=(answer_params)
    self.wrong_answers.map { |wrong| wrong.delete }
    answer_params.each_value do |param|
      self.answers << Answer.new(text: param["text"])
    end
  end

  def user
    self.quiz.course.user
  end

  def right_answer?(answer_id)
    answer_id.to_i == correct_answer.id
  end
end
