# the convention in Rails is to use pluralized model name if the controller
# if the controller is related to that model
# eg, if the model name is question, the controller name is questions
# generate a controller by running:
# $rails g controller questions
class QuestionsController < ApplicationController
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
    # Question.create({title: params[:question[:title]], body: params[:question[:body]]})
    question_params = params.require(:question).permit([:title, :body])
    @q = Question.new(question_params)
    if @q.save
      # render text: "Record saved!"
      redirect_to(question_path(@q))
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
    @q = Question.find(params[:id])
    # default: render: views/questions/show.html.erb
  end

  def edit
    @q = Question.find(params[:id])
    @q = Question.find(params[:id])
  end

  def update
    @q = Question.find(params[:id])
    question_params = params.require(:question).permit([:title, :body])
    @q.update(question_params)
    if @q.save
      redirect_to(question_path(@q))
    else
      render :edit
    end
  end

  def index
    @questions = Question.all
  end

  def destroy
    @q = Question.find(params[:id])
    @q.destroy
    redirect_to questions_path
  end
end
