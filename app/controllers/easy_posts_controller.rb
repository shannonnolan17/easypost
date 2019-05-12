require 'easypost'

class EasyPostsController < ApplicationController
  before_action :set_easy_post, only: [:show, :edit, :update, :destroy]

  # GET /easy_posts
  # GET /easy_posts.json
  def index
    @easy_posts = EasyPost.all
  end

  # GET /easy_posts/1
  # GET /easy_posts/1.json
  def show
  end

  # GET /easy_posts/new
  def new
    @easy_post = EasyPost.new
  end

  # GET /easy_posts/1/edit
  def edit
  end

  # POST /easy_posts
  # POST /easy_posts.json
  def create
    p "*********"
    EasyPost.api_key = ENV['EASY_POST_API']


    # @easy_post = EasyPost.new(easy_post_params)
    #
    # respond_to do |format|
    #   if @easy_post.save
    #     format.html { redirect_to @easy_post, notice: 'Easy post was successfully created.' }
    #     format.json { render :show, status: :created, location: @easy_post }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @easy_post.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /easy_posts/1
  # PATCH/PUT /easy_posts/1.json
  def update
    respond_to do |format|
      if @easy_post.update(easy_post_params)
        format.html { redirect_to @easy_post, notice: 'Easy post was successfully updated.' }
        format.json { render :show, status: :ok, location: @easy_post }
      else
        format.html { render :edit }
        format.json { render json: @easy_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /easy_posts/1
  # DELETE /easy_posts/1.json
  def destroy
    @easy_post.destroy
    respond_to do |format|
      format.html { redirect_to easy_posts_url, notice: 'Easy post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_easy_post
      @easy_post = EasyPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def easy_post_params
      params.require(:easy_post).permit(:address)
    end
end
