class MainController < ApplicationController
  def index;
    @photo = Photo.find_by_price(4930)[:link]
  end
  def search
    @offers = Photo.find_by_quantity(search).all
  end
end
