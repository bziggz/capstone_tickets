class CommentsController < ApplicationController
  before_action :logged_in_user
  before_action :get_ticket_and_comment, only: [:edit, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @ticket = Ticket.find(params[:ticket_id])
    @comment = @ticket.comments.build(comment_params)
    @comment.creator = current_user.id

    update_status

    if params[:commit] == 'Update Status Only'
      flash[:success] = 'Status successfully updated'
      redirect_to ticket_path(@ticket.id) and return
    end

    if @comment.save
      flash[:success] = 'Your comment was successfully created'
      redirect_to ticket_path(@ticket.id)
    else
      flash[:danger] = 'Comment creation was unsuccessful'
      redirect_to ticket_path(@ticket.id)
    end
  end

  def edit; end

  def update
    @ticket = Ticket.find(params[:ticket_id])
    @comment = Comment.find(params[:id])

    update_status

    if params[:commit] == 'Update Status Only'
      flash[:success] = 'Status successfully updated'
      redirect_to ticket_path(@ticket.id) and return
    end

    if @comment.update(comment_params)
      flash[:success] = 'Your comment was successfully updated'
      redirect_to ticket_path(@ticket.id)
    else
      flash[:alert] = 'Comment update was unsuccessful'
      render edit_ticket_comment_path(@ticket.id, params[:id])
    end
  end

  def destroy
    @comment.destroy 

    redirect_to ticket_path(@ticket.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :id)
  end

  def update_status
    @comment.ticket.update(status: params[:comment][:status_update]) if
      params[:comment][:status_update] != @ticket.status
  end

  def get_ticket_and_comment
    @ticket = Ticket.find(params[:ticket_id])
    @comment = Comment.find(params[:id])
  end
end

