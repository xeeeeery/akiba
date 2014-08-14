class ItemCommentsController < ApplicationController
  before_action :set_item_comment, only: [:show, :edit, :update, :destroy]

  # GET /item_comments
  # GET /item_comments.json
  def index
    @item_comments = ItemComment.all
  end

  # GET /item_comments/1
  # GET /item_comments/1.json
  def show
  end

  # GET /item_comments/new
  def new
    @item_comment = ItemComment.new
  end

  # GET /item_comments/1/edit
  def edit
  end

  # POST /item_comments
  # POST /item_comments.json
  def create
    @item_comment = ItemComment.new(item_comment_params)
    @item_comment.user = current_user
    respond_to do |format|
      if @item_comment.save
        format.html { redirect_to @item_comment, notice: 'Item comment was successfully created.' }
        format.json { render :show, status: :created, location: @item_comment }
      else
        format.html { render :new }
        format.json { render json: @item_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_comments/1
  # PATCH/PUT /item_comments/1.json
  def update
    respond_to do |format|
      if @item_comment.update(item_comment_params)
        format.html { redirect_to @item_comment, notice: 'Item comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_comment }
      else
        format.html { render :edit }
        format.json { render json: @item_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_comments/1
  # DELETE /item_comments/1.json
  def destroy
    @item_comment.destroy
    respond_to do |format|
      format.html { redirect_to item_comments_url, notice: 'Item comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_comment
      @item_comment = ItemComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_comment_params
      params.require(:item_comment).permit(:body, :user_id, :item_id)
    end
end
