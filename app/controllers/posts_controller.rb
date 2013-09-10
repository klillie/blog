class PostsController < ApplicationController

	http_basic_authenticate_with name: "dhh", password: "secret",
	except: [:index, :show]


	def new 
		@post= Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to action: :show, id: @post.id	
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def index
		@posts =Post.all
	end

	def edit
		@post = Post.find(params[:id])
	end


#To Be un-commented when not so tired..... 

	def update
		@post =Post.find(params[:id])

		if @post.update( post_params)
			redirect_to action: :show, id: @post.id

		else
			render 'edit'
		end
		
	end			

#destroy posts-- had to change "redirect_to action: :index"
	def destroy
			@post = Post.find(params[:id])
			@post.destroy

			redirect_to action: :index
		end

private
		def post_params
			params.require(:post).permit(:title, :text)
		end
end
