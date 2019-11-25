class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :search]

  def home
  end

  def search
    @default_tags = Tag.all.where(default: true)
    @other_tags = Tag.all.where(default: false)
  end
end
