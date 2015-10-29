class ApplicationController < ActionController::Base
  # inherits from module ActionController
  # ActionController has a class Base; this is what ApplicationController inherits


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
