class GuessesController < ApplicationController
  before_action :set_guess, only: %i[ show edit update destroy ]

  # GET /guesses or /guesses.json
  def index
    @guesses = Guess.all
  end

  # GET /guesses/1 or /guesses/1.json
  def show
  end

  # GET /guesses/new
  def new
    @guess = Guess.new
    @guess[:user_id] = params[:user_id]
    @guess[:game_session_id] = params[:game_session_id]
    @score = 0
  end

  # GET /guesses/1/edit
  def edit
  end

  # POST /guesses or /guesses.json
  def create
    @guess = Guess.new(guess_params)
    @guess.save
    @round = Guess.where(game_session_id: @guess[:game_session_id]).count
    @score = WordsDifference.call(guessed_word: @guess.guessed_word, target_word: @guess.game_session.word)
    @guess.game_session.score = (6-@round)*20  if @score.sum == 10

    if @round == 5 || @score.sum == 10
      @guess.game_session.done = true
      @guess.game_session.save!
    end
    redirect_to guess_url(id:@guess.id, score:@score, round:@round), notice: "Your guess was successfully recorded."

  end

  # PATCH/PUT /guesses/1 or /guesses/1.json
  def update
    respond_to do |format|
      if @guess.update(guess_params)
        format.html { redirect_to guess_url(@guess), notice: "Guess was successfully updated." }
        format.json { render :show, status: :ok, location: @guess }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guess.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guesses/1 or /guesses/1.json
  def destroy
    @guess.destroy

    respond_to do |format|
      format.html { redirect_to guesses_url, notice: "Guess was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guess
      @guess = Guess.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guess_params
      params.require(:guess).permit(:guessed_word, :game_session_id, :user_id)
    end


end
