class WelcomeController < ApplicationController
  def index
  end
  def faq
    @posts = Post.all
  end
  def terms
    @post = Post.last
  end
  def about
    @post = Post.last
  end
  def contact
  end
end
