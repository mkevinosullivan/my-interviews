class JobPostingsController < ApplicationController
  before_action :set_job_posting, only: [:show, :edit, :select_candidates, :set_candidates, :update, :destroy]

  # GET /job_postings
  # GET /job_postings.json
  def index
    @job_postings = JobPosting.all
  end

  # GET /job_postings/1
  # GET /job_postings/1.json
  def show
    get_current_candidates
  end

  # GET /job_postings/new
  def new
    @job_posting = JobPosting.new
    @questionnaires = Questionnaire.all
    @current_questionnaire = nil

    puts "###"
    puts "### DEBUG" + params.to_s
    puts "### questionnaires.size = " + (@questionnaires ? @questionnaires.size.to_s : "[no questionnaires]")
    puts "###"

    if @questionnaires.size == 0
      redirect_to questionnaires_url, notice: "Please create a questionnaire before creating a job posting."
    end
  end

  # GET /job_postings/1/edit
  def edit
    set_questionnaire_params
  end

  # GET /job_postings/1/select_candidates
  def select_candidates
    @current_candidates = @job_posting.candidates

    if @current_candidates.size > 0
      @other_candidates = Candidate.where.not(id: @current_candidates.pluck(:candidate_id))
    else
      @other_candidates = Candidate.all
    end
  end

  # POST /job_postings
  # POST /job_postings.json
  def create
    @job_posting = JobPosting.new(job_posting_params)

    if @job_posting.save
      redirect_to select_candidates_url(@job_posting), notice: 'Job posting was successfully created - select candidates for interview.'
    else
      set_questionnaire_params
      render :new
    end
  end

  # PATCH/PUT /job_postings/1
  # PATCH/PUT /job_postings/1.json
  def update
    puts "###"
    puts "### DEBUG" + params.to_s
    puts "### job_posting_params = " + job_posting_params.to_s
    puts "###"

    if @job_posting.update(job_posting_params)
      redirect_to select_candidates_url(@job_posting), notice: 'Job posting was successfully updated - update candidates for interview (if needed).'
    else
      render :edit
    end
  end

  # POST /job_postings/1/set_candidates
  def set_candidates
    puts "###"
    puts "### DEBUG" + params.to_s
    puts "### candidates_params = " + (candidates_params ? candidates_params.to_s : "[no candidates]")
    puts "###"
    
    candidate_ids = []
    if candidates_params
      candidates_params.each do |candidate_id|
        candidate_ids << candidate_id.to_i
      end
    end
    @job_posting.candidate_ids = candidate_ids

    get_current_candidates
    render :show, notice: 'Candidates for job posting were successfully updated.'
  end

  # DELETE /job_postings/1
  # DELETE /job_postings/1.json
  def destroy
    @job_posting.destroy
    respond_to do |format|
      format.html { redirect_to job_postings_url, notice: 'Job posting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_posting
      @job_posting = JobPosting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_posting_params
      params.require(:job_posting).permit(:description, :posting_link, :questionnaire_id)
    end

    def set_questionnaire_params
      @questionnaires = Questionnaire.all
      @current_questionnaire_id = @job_posting.questionnaire_id
    end

    def candidates_params
      begin
        params.require(:candidates)
      rescue ActionController::ParameterMissing
        nil
      end
    end

    def get_current_candidates
      @current_candidates = @job_posting.candidates
    end
end
