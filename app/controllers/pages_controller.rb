class PagesController < ApplicationController

  before_action :authenticate_user!, except: [:login]

  def index
  end

  def contact
  end

  def talks
  end

  def camps 
  end

  def dcpa 
  end

  def groups 
  end

  def cfs
  end

  def comingsoon
  end

  def login
  end
  
end
