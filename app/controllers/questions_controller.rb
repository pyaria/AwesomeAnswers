# the convention in Rails is to use pluralized model name if the controller
# if the controller is related to that model
# eg, if the model name is question, the controller name is questions
# generate a controller by running:
# $rails g controller questions
class QuestionsController < ApplicationController
  # before action will register a method (in thie scase call find_question)
  # that will be executed before all actions unless you specify options such as:
  # :except or :only (SO A SUBSET OF ACTIONS)
  # before_action is a method that comes with RAILS (convention)
  before_action(:find_question, {only: [:show, :edit, :update, :destroy]})
  def new
    # the default behavior of controller action is to render a template
    # within a folder with the same controller name using the format/templating language used
    # in thise case we're using the default format which is HTML
    # we are using the default templating language which is ERB
    # so the controller action will render template:
    # views/questions/new.html.erb
    @q = Question.new
  end

  def create

    @q = Question.new(question_params)
    if @q.save
      # render text: "Record saved!"
      redirect_to(question_path(@q), notice: "Question created!")
    else
      # render text: "Record not saved!"
      # render text: "Didn't save correctly! #{q.errors.full_messages.join(", ")}"
      @errormessage = "#{@q.errors.full_messages.join(", ")}"
      render :new
    end
    # render text: "Inside Questions Create: #{params[:question]}"
  end

  # GET /questions/id
  # you get access to the id in the url from params[:id]
  def show
    # finding the question by its id
    # default: render: views/questions/show.html.erb
  end

  def edit
  end

  def update
    @q.update(question_params)
    if @q.save
      redirect_to(question_path(@q), notice: "Question updated!")
    else
      render :edit
    end
  end

  def index
    @questions = Question.all
  end

  def destroy
    @q.destroy
    # flash[:notice] = "Question deleted successfully"
    redirect_to(questions_path, notice: "Questions deleted successfully")
  end

  private
  def find_question
    # finding the question by its id
    # default: render: views/questions/show.html.erb
    @q = Question.find(params[:id])
  end

  def question_params
    # Question.create({title: params[:question[:title]], body: params[:question[:body]]})
    params.require(:question).permit([:title, :body])
  end

end
