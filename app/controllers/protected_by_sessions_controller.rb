class ProtectedBySessionsController < ApplicationController
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery unless: -> { request.format.json? }
  before_action :check_session
  prepend_after_action :check_session_after
  before_action :authenticate_user!

  def check_session
    if cookies['session'].nil?
      render json: { 'error' => 'no session' }, status: 403
    else 
      tokens = JSON.parse(cookies.fetch("session")).fetch("tokens")
      relevant_headers = tokens.symbolize_keys.slice(*DeviseTokenAuth.headers_names.keys)

      # NOTE Potentially dangerous depending on the value of DeviseTokenAuth.headers_names.keys.
      relevant_headers.each do |k, v|
        request.headers[k] = v
      end
    end
  end

  def check_session_after
    unless cookies['session'].nil?
      cookie_session = JSON.parse(cookies.fetch("session"))
      token_headers = response.headers.symbolize_keys.slice(*DeviseTokenAuth.headers_names.keys)
      cookie_session["tokens"] = token_headers
      cookies["session"] = cookie_session.to_json
    end
  end
end
