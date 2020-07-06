class Admins::HomeController < ApplicationController
  layout 'admins/application'
  before_action :authenticate_admin!
  def index
  end
end
