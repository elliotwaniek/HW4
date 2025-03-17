class EntriesController < ApplicationController

  def new
  end

  def create
    @entry = Entry.new
    @entry.title = params[:title]
    @entry.description = params[:description]
    @entry.occurred_on = params[:occurred_on]
    @entry.place_id = params[:place_id]
    @entry.uploaded_image.attach(params[:uploaded_image]) if params[:uploaded_image].present?
    @entry.save
    redirect_to place_path(@entry.place)
  
  end

end
