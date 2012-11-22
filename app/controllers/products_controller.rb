class ProductsController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :text=>{:data_set=>Product.count}.to_json }
    end
  end

  def show
    product=Product.where(:code=>params[:code]).first
    respond_to do |format|
      format.json { render :text=>[product].try(:to_json) }
  	end
  end

end
