class Api::PlacesController < ApplicationController

  def index
    respond_to do |f| 
      f.json { render json: { :user => current_user } }
    end  
  end

end
