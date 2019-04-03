class SimplePagesController < ApplicationController

  def landing_page
    @products = Product.all
    @featured_product = Product.first
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.thank_you(@email, @name, @message).deliver_now
  end

end
