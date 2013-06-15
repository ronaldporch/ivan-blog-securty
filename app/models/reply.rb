class Reply < ActiveRecord::Base
  attr_accessible :comment, :body
  belongs_to :comment
end
