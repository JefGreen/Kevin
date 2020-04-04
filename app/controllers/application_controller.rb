class ApplicationController < ActionController::Base
  before_action :authenticate_user!
	add_flash_types :notification

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def color(percentage)
    case percentage.to_i
    when 'NA'
      "red"
    when 0...10
      "red"
    when 10...40
      "orange"
    when 40...100
      "blue"
    when 100
      "green"
    else
      ""
    end
  end
  helper_method :color

  module ApplicationHelper
    def title(text)
      content_for :title, text
    end
  end
end
