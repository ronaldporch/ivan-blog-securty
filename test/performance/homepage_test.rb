require 'test_helper'
require 'rails/performance_test_help'

class HomepageTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
  # self.profile_options = { :runs => 5, :metrics => [:wall_time, :memory]
  #                          :output => 'tmp/performance', :formats => [:flat] }

  def setup
    SCALE.times do
      p = Post.create(
        title: Faker::Company.catch_phrase,
        body: Faker::Lorem.paragraphs.join("<br>").html_safe
      )
      SCALE.times do
        c = p.comments.build(body: Faker::Lorem.paragraphs.join("<br>").html_safe)
        r = c.replies.build(body: Faker::Lorem.paragraphs.join("<br>").html_safe)
        p.save!
      end
    end
  end

  def teardown
    Post.destroy_all
  end

  def test_homepage
    get '/'
  end
end
