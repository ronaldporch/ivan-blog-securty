class Post < ActiveRecord::Base
  attr_accessible :body, :title, :published
  has_many :comments, dependent: :destroy

  def publish_status
    published? ? "published" : "unpublished"
  end

  def self.search(search)
    if search
      search.strip
      includes(comments: :replies).where("title like '%#{search}%'")
    else
      includes(comments: :replies).order("updated_at DESC")
    end
  end
end
