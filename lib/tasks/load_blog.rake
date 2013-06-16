namespace :load_blog do
  desc "loads a lot of comments into the blog"
  task :load_posts => :environment do
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

 desc "loads a lot of posts into the blog"
  task :load_comments => :environment do
    puts "pending"
  end

  desc "loads a lot of replies into the blog"
  task :load_replies => :environment do
    puts "pending"
  end

end
