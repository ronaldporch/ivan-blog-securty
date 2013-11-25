namespace :load_blog do
  desc "loads a lot of shit into the blog"
  task :load_shit => :environment do
    100.times do
      p = Post.create(
        title: Faker::Company.catch_phrase,
        body: Faker::Lorem.paragraphs.join("\n")
      )
      100.times do
        c = p.comments.build( body: Faker::Lorem.paragraphs.join("\n"))
        r = c.replies.build(  body: Faker::Lorem.paragraphs.join("\n"))
        p.save!
      end
    end
  end
  desc "loads a little bit of shit into the blog"
  task :few => :environment do
    10.times do
      p = Post.create(
        title: Faker::Company.catch_phrase,
        body: Faker::Lorem.paragraphs.join("\n")
      )
      10.times do
        c = p.comments.build( body: Faker::Lorem.paragraphs.join("\n"))
        r = c.replies.build(  body: Faker::Lorem.paragraphs.join("\n"))
        p.save!
      end
    end
  end
end
