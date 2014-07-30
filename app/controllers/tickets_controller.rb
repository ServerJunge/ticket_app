class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to root_path, notice: "Ticket created!"
    else
      render :new
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update(ticket_params)
      redirect_to root_path, notice: "Ticket updated!"
    else
      render :edit
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :client, :archived)
  end
end
