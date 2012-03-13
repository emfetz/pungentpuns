class SearchController < ApplicationController
  def index
    @zip_code = ZipCode.new(params[:zip_code]) if params[:zip_code].present?
    @spellcheck = Spellcheck.new(params[:query]) if params[:query].present?
  end
  
  def search
    # etc...
  end
  
  
end
