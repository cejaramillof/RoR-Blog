class Post < ApplicationRecord
  has_many :comments, as: :commentable, :dependent => :delete_all
  has_many :has_categories
	has_many :categories, through: :has_categories
  after_create :save_categories
  after_update :save_categories
  default_scope { order(created_at: :desc) }

  def categories=(value) #Custom setter
    @categories = value
  end

  private
  def save_categories
    unless @categories.nil?
      @categories.each do |category_id|
        HasCategory.create_or_update(category_id: category_id, post_id: self.id)
      end
    end
  end
end
