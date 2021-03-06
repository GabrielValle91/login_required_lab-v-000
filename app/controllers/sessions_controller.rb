class SessionsController < ApplicationController
  before_action :logged_in?
  skip_before_action :logged_in?, only: [:new, :create]

  def new
  end

  def create
    if params[:name]
      if !params[:name].empty?
        session[:name] = params[:name]
        redirect_to '/'
      else
        redirect_to '/login'
      end
    else
      redirect_to '/login'
    end
  end

  def destroy
    if session[:name]
      session.delete :name
      redirect_to '/login'
    else
      redirect_to '/login'
    end
  end
end
