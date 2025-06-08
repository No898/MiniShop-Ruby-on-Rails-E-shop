class Admin::AdminController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    redirect_to root_path, alert: 'Nemáte oprávnění pro vstup do této sekce.' unless current_user.admin?
  end
end 