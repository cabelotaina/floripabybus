class LineController < ApplicationController

 def index
  @lines = Line.all
  render json:  @lines , root: false #"lines"
 end

end
