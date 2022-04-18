require "application_system_test_case"

class GameSessionsTest < ApplicationSystemTestCase
  setup do
    @game_session = game_sessions(:one)
  end

  test "visiting the index" do
    visit game_sessions_url
    assert_selector "h1", text: "Game sessions"
  end

  test "should create game session" do
    visit game_sessions_url
    click_on "New game session"

    check "Done" if @game_session.done
    fill_in "Score", with: @game_session.score
    fill_in "Word", with: @game_session.word
    click_on "Create Game session"

    assert_text "Game session was successfully created"
    click_on "Back"
  end

  test "should update Game session" do
    visit game_session_url(@game_session)
    click_on "Edit this game session", match: :first

    check "Done" if @game_session.done
    fill_in "Score", with: @game_session.score
    fill_in "Word", with: @game_session.word
    click_on "Update Game session"

    assert_text "Game session was successfully updated"
    click_on "Back"
  end

  test "should destroy Game session" do
    visit game_session_url(@game_session)
    click_on "Destroy this game session", match: :first

    assert_text "Game session was successfully destroyed"
  end
end
