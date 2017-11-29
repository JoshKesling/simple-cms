class SectionsController < ApplicationController
  def index
    @sections = Sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:name = 'Default')
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    if @section.update_attributes(section_params)
      flash[:notice] = "Section #{@section.name} was updated successfully."
      redirect_to(action: :show, @section.id)
    else
      flash[:error] = "There was an error while updating this section"
      render(:edit)
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section #{section.name} was successfully deleted."
    render(:index)
  end

  #Begin Private Methods
  private

  def section_params
    params.require(:section).permit(:page_id, :name, :postion, :visible, :content_type, :content)
  end
end
