class ChoresController < ApplicationController
  def index
    @chores = Chore.order(:created_at)
  end

  def active
    @chores = Chore.all.where(completed: false)
    render 'index'
  end

  def completed
    @chores = Chore.all.where(completed: true)
    render 'index'
  end

  def toggle
    @chore = Chore.find(params[:id])
    @chore.toggle!(:completed)
    redirect_to root_path
  end

  def create
    @chore = Chore.new(chore_params)
    if @chore.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy
    redirect_to root_path
  end

  def destroy_completed
    @chores = Chore.all.where(completed: true)
    @chores.destroy_all
    redirect_to root_path
  end

  private

    def chore_params
      params.require(:chore).permit(:name)
    end

end
