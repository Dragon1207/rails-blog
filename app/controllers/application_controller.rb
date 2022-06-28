class ApplicationController < ActionController::Base
  before_action :check_for_dark_mode

  def check_for_dark_mode
    @dark_mode = cookies[:dark_mode] == 'true'
  end
end
