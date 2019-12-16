class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]

  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  # GET /responses/list
  def list
    @candidate = Candidate.find(params[:candidate_id])
    @job_posting = JobPosting.find(params[:job_posting_id])
    @responses = Response.where(candidate_id: @candidate.id, job_posting_id: @job_posting.id)
  end

  # POST /responses
  # POST /responses.json
  def create
    responses = extract_responses
    # @response = Response.new(response_params)

    all_saved = true
    responses.each do |response_data|
      response = Response.new(response_data)
      all_saved = all_saved && response.save
    end

    if all_saved
      flash.notice = {
        alert_class: :success,
        message: "Response(s) were successfully saved."
      }
      redirect_to job_posting_path(id: params[:job_posting_id])
    else
      flash.notice = {
        alert_class: :danger,
        message: "Responses and/or scores cannot be blank."
      }
      redirect_to interview_path(candidate_id: params[:candidate_id], job_posting_id: params[:job_posting_id])
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        flash.notice = {
          alert_class: :success,
          message: "Response was successfully updated."
        }
        format.html { redirect_to @response }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      flash.notice = {
        alert_class: :success,
        message: "Response was successfully destroyed."
      }
      format.html { redirect_to responses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def response_params
      params.require(:response).permit(:response, :score)
    end

    def extract_responses
      responses = []

      (params[:question_count].to_i).times do |index|
        responses << {
          response: params['response-'+index.to_s],
          score: params['score-'+index.to_s],
          question_id: params['question_id-'+index.to_s],
          candidate_id: params[:candidate_id],
          job_posting_id: params[:job_posting_id]
        }
      end

      responses
    end
end
