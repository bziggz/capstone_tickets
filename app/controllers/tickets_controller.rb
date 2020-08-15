class TicketsController < ApplicationController
  before_action :logged_in_user, except: %i[index show]

  def index
    @tickets = Ticket.all
    @tickets = @tickets.filter_by_project(params[:project_id]) if params[:project_id].present?
    @tickets = @tickets.filter_by_status(params[:status]) if params[:status].present?
    @tickets = @tickets.filter_by_tag(params[:tag]) if params[:tag].present?
  end

  def show
    @ticket = Ticket.find(params[:id])
    @comment = Comment.new
  end

  def new
    @ticket = Ticket.new
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.creator_id = current_user.id

    add_tags

    if @ticket.save
      flash[:success] = 'Ticket has been created.'
      redirect_to tickets_path
    else
      render new_ticket_path
    end
  end

  def update
    @ticket = Ticket.find(params[:id])

    add_tags

    if @ticket.update(ticket_params)
      flash[:success] = 'Ticket has been updated.'
      redirect_to tickets_path
    else
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])

    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def add_tags
    if params[:tags]
      tags = params[:tags].map { |tag_id| Tag.find(tag_id) }
      @ticket.tags = tags
    end
  end

  def ticket_params
    params.require(:ticket).permit(:name, :body, :status, :project_id, :assignee)
  end
end
