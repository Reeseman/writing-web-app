# typed: true
class ApplicationController < ActionController::Base
  extend T::Sig 
  
  protect_from_forgery with: :null_session

  def index; end
end
