class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    # debugger
    @cat = Cat.new(cat_params)

    if @cat.save
      # debugger
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def edit
 
    @cat = Cat.find(params[:id])
    render :edit   
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      redirect_to edit_cat_url
    end

  end

  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end
