module ApplicationCable
  class Connection < ActionCable::Connection::Base
    def connect
      Rails.logger.info "CONNECTED: ACS"
    end
  end
end
