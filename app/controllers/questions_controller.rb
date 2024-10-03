class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_template

  def new
    @question = @template.questions.new
  end

  def create
    @question = @template.questions.new(question_params)
    if @question.save
      redirect_to new_template_question_path(@template), notice: "Question added successfully."
    else
      render :new
    end
  end

  private

  def set_template
    @template = Template.find(params[:template_id])
  end

  def question_params
    params.require(:question).permit(:label, :input_type, options: [])
  end

  def check_admin
    redirect_to root_path, alert: "You are not authorized." unless current_user.admin?
  end

end
