class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_session
  def new
    @questions = @session.template.questions
    @answers = @questions.map { |q| @session.answers.new(question: q) }
  end

  def create
    answers_params.each do |answer_params|
      @session.answers.create!(answer_params.merge(tester_id: current_user.id))
    end
    redirect_to sessions_path, notice: 'Answers saved successfully.'
  end

  private

  def set_session
    @session = Session.find(params[:session_id])
  end

  def answers_params
    params.require(:answers).map do |answer|
      answer.permit(:answer_value, :question_id)
    end
  end

end
