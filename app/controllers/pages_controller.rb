class PagesController < ApplicationController

  # before_action :authenticate_user!, except: [:login]

  def index
  end

  def contact
  end

  def login
  end

  def dashboard_coach
      @constant = "something"
  end
  
end
