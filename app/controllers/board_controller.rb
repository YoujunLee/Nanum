class BoardController < ApplicationController
  def posts
		@posts = Post.all
  end

  def posts_category
		case params[:category]
		when "used"
			@category ="중고장터"
		when "together"
			@category ="공동구매"
		when "give"
			@category ="나눔"
		when "help"
			@category ="도와주세요"
  end

	@posts = Post.where(category: @category)
	end

  def show
  end

  def write
  end

  def write_complete
  end

  def edit
  end

  def edit_complete
  end

  def delete_complete
  end
end
