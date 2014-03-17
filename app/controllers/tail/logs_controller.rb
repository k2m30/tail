require_dependency "tail/application_controller"

module Tail
  class LogsController < ApplicationController
    def index
      @web_logger ||= Log.instance
      @web_logger.n = params[:n]
      params[:n] = @web_logger.n
      log_file_name = params[:file_name] || "#{Rails.env}.log"
      @files = @web_logger.tail(log_file_name)
    end
  end
end
