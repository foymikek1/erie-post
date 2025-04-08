class TagsController < ApplicationController
  
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    tagging = Tagging.find_by(tag_id: params[:id])
    Tagging.destroy(tagging.id)
    Tag.destroy(params[:id])
    redirect_to tags_path
  end

end