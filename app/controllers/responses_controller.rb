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

  # POST /responses
  # POST /responses.json
  def create
    responses = extract_responses
    # @response = Response.new(response_params)

    puts "## DEBUG - number of responses ## [" + responses.size.to_s + "]"

    all_saved = true
    responses.each do |response_data|
      puts "## DEBUG - response_data ## [" + response_data.to_s + "]"
      response = Response.new(response_data)
      puts "## DEBUG - response, after Response.new ## [" + response.to_s + "]"
      all_saved = all_saved && response.save!
    end

    if all_saved
      redirect_to candidates_path, notice: 'Response(s) were successfully saved.'
    else
      redirect_to questions_path(candidate_id: params[:candidate_id])
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to @response, notice: 'Response was successfully updated.' }
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
      format.html { redirect_to responses_url, notice: 'Response was successfully destroyed.' }
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
      # puts "## DEBUG ## [" + params.to_s + "]"
      responses = []

      puts "## DEBUG ## [" + (params[:question_count].to_i-1).to_s + "]"
      (params[:question_count].to_i-1).times do |index|
        responses << {
          response: params['response-'+index.to_s],
          score: params['score-'+index.to_s],
          question_id: params['question_id-'+index.to_s],
          candidate_id: params[:candidate_id]
        }
      end

      puts "## DEBUG ## [" + responses.to_s + "]"
      responses
    end
end
