class PagesController < ApplicationController
  layout false

  def index
    @pages = Pages.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({name: 'Default'})
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page #{@page.name} was created successfully."
      redirect_to(action: :index)
    else
      flash[:error] = "There was an error creating the page."
      render(:new)
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page #{@page.name} was updated successfully."
      redirect_to(action: :show, id: @subject.id)
    else
      flash[:error] = "There was an error updating the page."
      render(:edit)
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "The page #{page.name} was deleted."
    redirect_to(action: :index)
  end

  #Begin Private Methods
  private

  def page_params
    params.require(:page).permit(:name, :permalink, :position, :visible)
  end

end