class TagsController < ApplicationController
  before_action :find_tag, only: [:show, :edit, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show; end

  def new
    @tag = Tag.new
  end

  def edit; end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:success] = "Tag successfully created"
      redirect_to tags_path
    else
      render 'new'
    end
  end

  def update
    if @tag.update(tag_params)
      flash[:success] = "Tag was successfully updated"
      redirect_to tags_path
    else
      render 'edit'
    end
  end

  def destroy
    if @tag.destroy
      flash[:success] = 'Tag was successfully deleted.'
      redirect_to tags_path
    else
      redirect_to tags_path
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def find_tag
    @tag = Tag.find(params[:id])
  end
end

