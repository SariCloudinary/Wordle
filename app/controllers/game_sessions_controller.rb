class GameSessionsController < ApplicationController
  before_action :set_game_session, only: %i[ show edit update destroy ]

  # GET /game_sessions or /game_sessions.json
  def index
    @game_sessions = GameSession.all
  end

  # GET /game_sessions/1 or /game_sessions/1.json
  def show
  end

  # GET /game_sessions/new
  def new
    player_id = params[:user_id]
    if player_id.nil?
      return_home
    else
      @game_session = create_game_session(player_id)
      create_user_word(player_id, Word.find_by(name: @game_session.word).id)
      redirect_to new_guess_path(game_session_id:@game_session.id, user_id: @game_session.user_id)
    end
  end

  # GET /game_sessions/1/edit
  def edit
  end

  # POST /game_sessions or /game_sessions.json
  def create
    @game_session = GameSession.new(game_session_params)

    respond_to do |format|
      if @game_session.save
        format.html { redirect_to game_session_url(@game_session), notice: "Game session was successfully created." }
        format.json { render :show, status: :created, location: @game_session }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_sessions/1 or /game_sessions/1.json
  def update
    respond_to do |format|
      if @game_session.update(game_session_params)
        format.html { redirect_to game_session_url(@game_session), notice: "Game session was successfully updated." }
        format.json { render :show, status: :ok, location: @game_session }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_sessions/1 or /game_sessions/1.json
  def destroy
    @game_session.destroy

    respond_to do |format|
      format.html { redirect_to game_sessions_url, notice: "Game session was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def create_game_session(player_id)
    game_session = GameSession.new
    game_session[:user_id] = player_id
    game_session[:score] = 0
    new_word = UnseenWordFinder.call(player_id: player_id)
    game_session[:word] = new_word.name
    game_session.save!
    game_session
  end

  def create_user_word(user_id, word_id)
    user_word = UserWord.new
    user_word[:user_id] = user_id
    user_word[:word_id] = word_id
    user_word.save!
    user_word
  end

  def return_home
    respond_to do |format|
      format.html { redirect_to '/', notice: "Player need to be selected" }
      format.json { render :show, status: :created, location: @game_session }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
    def set_game_session
      @game_session = GameSession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_session_params
      params.require(:game_session).permit(:word, :score, :done, :user_id)
    end
end
