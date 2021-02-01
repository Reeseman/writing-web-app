class ApplicationController < ActionController::Base
  # protect_from_forgery prepend: true
  # before_action :authenticate_user!
  before_action do
    unless cookies['session'].nil?
      tokens = JSON.parse(cookies.fetch("session")).fetch("tokens")
      relevant_headers = tokens.symbolize_keys.slice(*DeviseTokenAuth.headers_names.keys)

      # NOTE Potentially dangerous depending on the value of DeviseTokenAuth.headers_names.keys.
      relevant_headers.each do |k, v|
        request.headers[k] = v
      end
    end
  end

  prepend_after_action do
    unless cookies['session'].nil?
      cookie_session = JSON.parse(cookies.fetch("session"))
      token_headers = response.headers.symbolize_keys.slice(*DeviseTokenAuth.headers_names.keys)
      cookie_session["tokens"] = token_headers
      cookies["session"] = cookie_session.to_json
    end
  end
end
