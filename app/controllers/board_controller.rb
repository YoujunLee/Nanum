class BoardController < ApplicationController
	before_action :login_check
	skip_before_action :login_check, :only =>[:posts, :posts_category, :show]

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
		@comment_writer = User.where(id: session[:user_id])[0]
  end

  def write
  	@user = User.find(session[:user_id])

	end

  def write_complete
		post = Post.new
		post.user_id = session[:user_id]
		post.category = params[:post_category]
		post.title = params[:post_title]
		post.price = params[:post_price]
		post.number = params[:post_number]
		post.content = params[:post_content]
		post.image = params[:image]

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
			if @post.user_id != session[:user_id]
				flash[:alert] = "수정 권한이 없습니다."
				redirect_to :back
			end
  end

  def edit_complete
		post = Post.find(params[:id])
		post.category = params[:post_category]
		post.title = params[:post_title]
		post.price = params[:post_price]
		post.number = params[:post_number]
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
		post = Post.find(params[:id])
	
		if post.user_id == session[:user_id]
			post.destroy
			flash[:alert] = "삭제되었습니다."
			redirect_to "/"
		else
			flash[:alert] = "삭제 권한이 없습니다."
			redirect_to :back
		end
  end

	def write_comment_complete
		comment = Comment.new
		comment.user_id = session[:user_id]
		comment.post_id = params[:post_id]
		comment.content = params[:comment_content]
		comment.save

		flash[:alert] = "새 댓글을 달았습니다."
		redirect_to "/board/show/#{comment.post_id}"
	end

	def delete_comment_complete
		comment = Comment.find(params[:id])

		if comment.user_id == session[:user_id]
			comment.destroy
			flash[:alert] = "댓글이 삭제되었습니다."
			redirect_to "/board/show/#{comment.post_id}"
		else
			flash[:alert] = "댓글 삭제 권한이 없습니다."
			redirect_to :back
		end
	end
end
