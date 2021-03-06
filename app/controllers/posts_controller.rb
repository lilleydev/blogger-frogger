class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :user_can, only: %i[edit update destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  # POST /posts.json
  def create
    # binding.pry
    user = User.find_by(id: params['post']['user'].to_i)
    @post = user.posts.build(post_params)
    # binding.pry

    render json: @post if @post.save
    # @post = current_user.posts.build(post_params)

    # respond_to do |format|
    #   if @post.save
    #     format.html { redirect_to @post, notice: 'Post was successfully created.' }
    #     format.json { render :show, status: :created, location: @post }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    # binding.pry
    if user_can
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to root_path
  end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    # binding.pry
    @post.destroy
    # respond_to do |format|
    # respond_to do |format|
    #   format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    render json: params[:id]
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:id, :content, :title, :mood, :category)
  end

  def user_can
    can? :manage, @post
  end
end
