require "application_system_test_case"

class GuessesTest < ApplicationSystemTestCase
  setup do
    @guess = guesses(:one)
  end

  test "visiting the index" do
    visit guesses_url
    assert_selector "h1", text: "Guesses"
  end

  test "should create guess" do
    visit guesses_url
    click_on "New guess"

    fill_in "Game session", with: @guess.game_session_id
    fill_in "Guessed word", with: @guess.guessed_word
    fill_in "User", with: @guess.user_id
    click_on "Create Guess"

    assert_text "Guess was successfully created"
    click_on "Back"
  end

  test "should update Guess" do
    visit guess_url(@guess)
    click_on "Edit this guess", match: :first

    fill_in "Game session", with: @guess.game_session_id
    fill_in "Guessed word", with: @guess.guessed_word
    fill_in "User", with: @guess.user_id
    click_on "Update Guess"

    assert_text "Guess was successfully updated"
    click_on "Back"
  end

  test "should destroy Guess" do
    visit guess_url(@guess)
    click_on "Destroy this guess", match: :first

    assert_text "Guess was successfully destroyed"
  end
end
