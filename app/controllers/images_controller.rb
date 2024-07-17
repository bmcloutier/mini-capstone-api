class ImagesController < ApplicationController
  def index
    @images = Image.all
    render template: "images/index"
  end
end
