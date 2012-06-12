class Article < ActiveRecord::Base

  belongs_to :user

  attr_accessible :author, :body, :title, :user_id

  validates :title, :presence => true,
                    :length => {:minimum => 3}

  validates :body, :presence => true,
                    :length => {:minimum   => 300,
                    :tokenizer => lambda { |str| str.scan(/\w+/) },
                    :too_short => "must have at least %{count} words"}
  validates :user_id, :presence => true

  def to_param
    "#{id}-#{title.gsub(/\W/, '-').downcase}"
  end
end
