class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  module ApplicationHelper
    def title(text)
      content_for :title, text
    end
  end
end
