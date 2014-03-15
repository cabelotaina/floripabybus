class LinesController < ApplicationController

 def index
  @lines = Line.all
  render json:  @lines , root: false, each_serializer: FullLineSerializer #"lines"
 end

 def show
  @line = Line.find_by(:number => params[:id])
  render json: @line, root: false 
 end
end
