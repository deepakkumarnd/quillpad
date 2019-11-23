# share session among all the subdomains
Rails.application.config.session_store :cookie_store, :key => '_quillpad_session'