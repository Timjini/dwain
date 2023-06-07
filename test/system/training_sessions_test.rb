require "application_system_test_case"

class TrainingSessionsTest < ApplicationSystemTestCase
  setup do
    @training_session = training_sessions(:one)
  end

  test "visiting the index" do
    visit training_sessions_url
    assert_selector "h1", text: "Training sessions"
  end

  test "should create training session" do
    visit training_sessions_url
    click_on "New training session"

    fill_in "Coach", with: @training_session.coach_id
    fill_in "Day", with: @training_session.day
    fill_in "Description", with: @training_session.description
    fill_in "Distance", with: @training_session.distance
    fill_in "Duration", with: @training_session.duration
    fill_in "Extra info", with: @training_session.extra_info
    fill_in "Footwear", with: @training_session.footwear
    fill_in "Initiation", with: @training_session.initiation
    fill_in "Media", with: @training_session.media
    fill_in "Name", with: @training_session.name
    fill_in "Pacing times", with: @training_session.pacing_times
    fill_in "Recovery", with: @training_session.recovery
    fill_in "Reps", with: @training_session.reps
    fill_in "Rpe", with: @training_session.rpe
    fill_in "Sets", with: @training_session.sets
    fill_in "Surface", with: @training_session.surface
    fill_in "Training type", with: @training_session.training_type
    click_on "Create Training session"

    assert_text "Training session was successfully created"
    click_on "Back"
  end

  test "should update Training session" do
    visit training_session_url(@training_session)
    click_on "Edit this training session", match: :first

    fill_in "Coach", with: @training_session.coach_id
    fill_in "Day", with: @training_session.day
    fill_in "Description", with: @training_session.description
    fill_in "Distance", with: @training_session.distance
    fill_in "Duration", with: @training_session.duration
    fill_in "Extra info", with: @training_session.extra_info
    fill_in "Footwear", with: @training_session.footwear
    fill_in "Initiation", with: @training_session.initiation
    fill_in "Media", with: @training_session.media
    fill_in "Name", with: @training_session.name
    fill_in "Pacing times", with: @training_session.pacing_times
    fill_in "Recovery", with: @training_session.recovery
    fill_in "Reps", with: @training_session.reps
    fill_in "Rpe", with: @training_session.rpe
    fill_in "Sets", with: @training_session.sets
    fill_in "Surface", with: @training_session.surface
    fill_in "Training type", with: @training_session.training_type
    click_on "Update Training session"

    assert_text "Training session was successfully updated"
    click_on "Back"
  end

  test "should destroy Training session" do
    visit training_session_url(@training_session)
    click_on "Destroy this training session", match: :first

    assert_text "Training session was successfully destroyed"
  end
end
