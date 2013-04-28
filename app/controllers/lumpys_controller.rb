class LumpysController < ApplicationController
  def index
    @image_index = rand(4)
  end
end
