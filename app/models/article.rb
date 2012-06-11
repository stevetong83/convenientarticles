class Article < ActiveRecord::Base

  belongs_to :user

  attr_accessible :author, :body, :title, :user_id

  validates :title, :presence => true
                    #:length => {:minimum => 5}
  validates :body, :presence => true
  validates :user_id, :presence => true

  def to_param
    "#{id}-#{title.gsub(/\W/, '-').downcase}"
  end
end
