class Post < ActiveRecord::Base
  # Remember to create a migration!
  before_create :remove_newline

  has_many :posts_tags
  has_many :tags, :through => :posts_tags
  belongs_to :user
  validates :body, :presence => true
  validates :title, :presence => true

  def remove_newline
    self.body.strip!
  end

end
