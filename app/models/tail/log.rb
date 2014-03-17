require 'singleton'
module Tail
  class Log
    include Singleton
    attr_reader :files
    attr_reader :n
    N_VALUE = 100

    def initialize
      begin
        @n = N_VALUE
        @files = Dir.entries(Rails.root.join('log').to_s).select { |file| file.include? '.log' }
      rescue
        return []
      end
    end

    def n=(value)
      if value.present? && value.to_i > 0
        @n =value.to_i
      else
        @n = N_VALUE
      end

    end

    # @return [log entries array]
    # @param [File name] file_name
    # @param [strings to return] n
    def tail(file_name)
      begin
        @files.include?(file_name) ? `tail -n #{@n} log/#{file_name}`.lines : []
      rescue
        return []
      end
    end
  end
end
