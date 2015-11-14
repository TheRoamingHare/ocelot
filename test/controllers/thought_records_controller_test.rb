require 'test_helper'

class ThoughtRecordsControllerTest < ActionController::TestCase
  setup do
    @thought_record = thought_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thought_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create thought_record" do
    assert_difference('ThoughtRecord.count') do
      post :create, thought_record: { AltResponse: @thought_record.AltResponse, AutoThoughts: @thought_record.AutoThoughts, CurrentSituation: @thought_record.CurrentSituation, Emotions: @thought_record.Emotions, FirstEmotionStrength: @thought_record.FirstEmotionStrength, SecondEmotionStrength: @thought_record.SecondEmotionStrength }
    end

    assert_redirected_to thought_record_path(assigns(:thought_record))
  end

  test "should show thought_record" do
    get :show, id: @thought_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @thought_record
    assert_response :success
  end

  test "should update thought_record" do
    patch :update, id: @thought_record, thought_record: { AltResponse: @thought_record.AltResponse, AutoThoughts: @thought_record.AutoThoughts, CurrentSituation: @thought_record.CurrentSituation, Emotions: @thought_record.Emotions, FirstEmotionStrength: @thought_record.FirstEmotionStrength, SecondEmotionStrength: @thought_record.SecondEmotionStrength }
    assert_redirected_to thought_record_path(assigns(:thought_record))
  end

  test "should destroy thought_record" do
    assert_difference('ThoughtRecord.count', -1) do
      delete :destroy, id: @thought_record
    end

    assert_redirected_to thought_records_path
  end
end
