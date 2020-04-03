class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	add_flash_types :notification

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end


  module ApplicationHelper
    def title(text)
      content_for :title, text
    end
  end
end
