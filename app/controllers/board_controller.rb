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
		@post = Post.find(params[:id])
  end

  def write
  end

  def write_complete
		post = Post.new
		post.category = params[:post_category]
		post.title = params[:post_title]
		post.price = params[:post_price]
#	post.number = params[:post_number]
		post.content = params[:post_content]

		if post.save
      flash[:alert] = "저장되었습니다."
      redirect_to "/board/show/#{post.id}"
    else
      flash[:alert] = post.errors.values.flatten.join(' ')
      redirect_to :back
    end
  end

  def edit
		@post = Post.find(params[:id])
  end

  def edit_complete
		post = Post.new
		post.category = params[:post_category]
		post.title = params[:post_title]
		post.price = params[:post_price]
#post.number = nil
		post.content = params[:post_content]

		if post.save
      flash[:alert] = "수정되었습니다."
      redirect_to "/board/show/#{post.id}"
    else
      flash[:alert] = post.errors.values.flatten.join(' ')
      redirect_to :back
    end
  end

  def delete_complete
  end
end
