require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  fixtures :tasks
  setup do
    @task = tasks(:one)
    @update = {
      title: 'test task',
      description: 'description of task',
      excerpt: 'short description',
      duration: 5,
      image_url: 'rails.png'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 3
    assert_select '#main .entry', minimum: 3
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: @update
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    patch :update, id: @task, task: @update
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
