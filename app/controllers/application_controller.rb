class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    root_url(subdomain: user.subdomain)
  end

  def status
    response = {
      app: 'ok',
      db: db_connection_count
    }

    render status: get_status_code(response), json: response
  end

  private

  def db_connection_count
    ActiveRecord::Base
      .connection
      .execute("select count(*) from pg_stat_activity where pid <> pg_backend_pid() and usename = current_user;")
      .first["count"]
  rescue => e
    -1
  end

  def get_status_code(response)
    return 600 if response[:db] < 0
    200
  end
end
