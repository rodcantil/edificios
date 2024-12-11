class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    modificar_el_rol
  end
end
