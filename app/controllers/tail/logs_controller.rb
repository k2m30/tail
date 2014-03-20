require_dependency "tail/application_controller"

module Tail
  class LogsController < ApplicationController
    before_filter :authenticate_user! if defined? Devise
    attr_reader :web_logger

    def index
      @files = tail
    end

    def grep
      @files = tail
      render '_main'
    end

    def tail
      @web_logger ||= Tail::Log.instance
      @web_logger.n = params[:n]
      params[:n] = @web_logger.n
      log_file_name = params[:file_name] || "#{Rails.env}.log"
      @web_logger.tail(log_file_name)
    end
  end
end