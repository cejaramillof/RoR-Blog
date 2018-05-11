class Comment < ApplicationRecord
  include AASM
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, :dependent => :delete_all
  belongs_to :user
  scope :unread, ->{ where(state: "unread")}

  aasm column: "state" do
    state :unread, initial: true
    state :read

    event :read do
      transitions from: :unread, to: :read
    end

    event :unread do
      transitions from: :read, to: :unread
    end

  end

end
