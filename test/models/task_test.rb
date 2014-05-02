require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "task attributes must not be empty" do
    task = Task.new
    assert task.invalid?
    assert task.errors[:title].any?
    assert task.errors[:description].any?
    assert task.errors[:excerpt].any?
    assert task.errors[:image_url].any?
    assert task.errors[:duration].any?
  end
  
  test "Task duration must be greater than zero" do
    task = Task.new(title: "test task",
             description: "task description",
             excerpt: "task excerpt",
             duration: -1,
             image_url: "rails.png")
    assert task.invalid?
    assert_equal ["must be greater than or equal to 1"], task.errors[:duration]
    
    task.duration = 0
    assert task.invalid?
    assert_equal ["must be greater than or equal to 1"], task.errors[:duration]
    
    end
  
  def new_task(image_url)
    Task.new(title: "test task",
             description: "task description",
             excerpt: "task excerpt",
             duration: 2,
             image_url: image_url)
  end
  test "image url" do
    ok = %w{image.jpg img.png image.gif ImG.JpG http://a.b.com/image.jpg}
    bad = %w{image.jpf img.pgg image.gif1 ImGJpG http://a.b.com/image.jbd}
    ok.each do |imagename|
      assert new_task(imagename).valid?, "#{imagename} should be valid"
    end
    bad.each do |imagename|
      assert new_task(imagename).invalid?, "#{imagename} shouldn't be valid"
    end
  end
end
