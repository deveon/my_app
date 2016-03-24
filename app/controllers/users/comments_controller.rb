class Users::CommentsController < CommentsController
#  before_action :set_commentable

def index
  @comments = Comment.all
end

def create
    @comment = Comment.new(comment_params)
    @comment.commentable_id = current_user.id
    @comment.commentable_type = "User"

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
end

private

def set_comment
      @comment = Comment.find(params[:id])
    end

def comment_params
      params.require(:comment).permit(:content, :commentable_id)
    end
end
