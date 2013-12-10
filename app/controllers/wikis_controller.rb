class WikisController < ApplicationController

  def index
  end

  def new
   @wiki = Wiki.new
  end

  def create
     @wiki = Wiki.new(params[:wiki])
    #raise # this will short-circuit the method
    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def show
     @wiki = Wiki.find(params[:id])
  end
end