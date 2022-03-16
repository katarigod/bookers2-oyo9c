class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:top, :show, :edit, :about]
  def top
  end

  def about
  end
end
