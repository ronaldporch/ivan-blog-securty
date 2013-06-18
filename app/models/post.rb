class Post < ActiveRecord::Base
  attr_accessible :body, :title
  has_many :comments

  def self.search(search)
    if search
      #safe
      #find(:all, :conditions => ['title like ?', "%#{search}%"])
      #where("title like ?", "%#{search}%")
      #
      #unsafe - SQL injection
      includes(comments: :replies).where("title like '%#{search}%'")
    else
      includes(comments: :replies)
    end
  end
end
