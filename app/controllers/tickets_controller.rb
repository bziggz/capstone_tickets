class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def create
    @ticket = Ticket.new(params.require(:ticket).permit(:name, :body, :status, :project_id))

    if @ticket.save
      flash[:success] = 'Ticket had been created.'
      redirect_to project_path(:project_id)
    else
      render new_ticket_path
    end
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update
      flash[:notice] = 'Ticket has been updated.'
      redirect_to project_path(:project_id)
    else
      render :edit
    end
  end

  def destroy
    @ticket = Ticket.find(params[:id])

    @ticket.destroy
    redirect_to project_path(:project_id)
  end
end
