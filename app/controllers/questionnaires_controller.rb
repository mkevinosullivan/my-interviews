class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]

  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.all
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
    @questions = @questionnaire.questions
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new

    @questions = Question.all

    puts "###"
    puts "### DEBUG" + params.to_s
    puts "### questionnaires.size = " + (@questions ? @questions.size.to_s : "[no questions]")
    puts "###"

    if @questions.size == 0
      flash.notice = {
        alert_class: :warning,
        message: "Please create at least one question before creating a questionnaire."
      }
      redirect_to questions_url
    end

  end

  # GET /questionnaires/1/edit
  def edit
    set_edit_params
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(questionnaire_params)

    if @questionnaire.save
      set_edit_params
      flash.notice = {
        alert_class: :success,
        message: "Questionnaire was successfully created - add one or more questions."
      }
      render :edit
    else
      render :new
    end
  end

  # PATCH/PUT /questionnaires/1
  # PATCH/PUT /questionnaires/1.json
  def update
    puts "###"
    puts "### DEBUG" + params.to_s
    puts "### questionnaire_params = " + questionnaire_params.to_s
    puts "### questions_params = " + questions_params.to_s
    puts "###"
    
    question_ids = []
    if questions_params
      questions_params.each do |question_id|
        question_ids << question_id.to_i
      end
    end

    questionnaire_saved = @questionnaire.update(questionnaire_params)
    @questionnaire.question_ids = question_ids

    if questionnaire_saved
      flash.notice = {
        alert_class: :success,
        message: "Questionnaire was successfully updated."
      }
      redirect_to @questionnaire
    else
      render :edit
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire.destroy
    respond_to do |format|
      flash.notice = {
        alert_class: :success,
        message: "Questionnaire was successfully deleted."
      }
      format.html { redirect_to questionnaires_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      params.require(:questionnaire).permit(:description)
    end

    def questions_params
      begin
        params.require(:questions)
      rescue ActionController::ParameterMissing
        nil
      end
    end

    def set_edit_params
      @questions_included = @questionnaire.questions
      @other_questions = Question.where.not(id: @questions_included.pluck(:id))
    end
end
