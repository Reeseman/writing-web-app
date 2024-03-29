# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/devise_token_auth/all/devise_token_auth.rbi
#
# devise_token_auth-7806104dc7c9

module ActionDispatch::Routing
end
class ActionDispatch::Routing::Mapper
  def mount_devise_token_auth_for(resource, opts); end
  def unnest_namespace; end
end
module DeviseTokenAuth
  def batch_request_buffer_throttle; end
  def batch_request_buffer_throttle=(val); end
  def bypass_sign_in; end
  def bypass_sign_in=(val); end
  def change_headers_on_each_request; end
  def change_headers_on_each_request=(val); end
  def check_current_password_before_update; end
  def check_current_password_before_update=(val); end
  def cookie_attributes; end
  def cookie_attributes=(val); end
  def cookie_enabled; end
  def cookie_enabled=(val); end
  def cookie_name; end
  def cookie_name=(val); end
  def default_callbacks; end
  def default_callbacks=(val); end
  def default_confirm_success_url; end
  def default_confirm_success_url=(val); end
  def default_password_reset_url; end
  def default_password_reset_url=(val); end
  def enable_standard_devise_support; end
  def enable_standard_devise_support=(val); end
  def headers_names; end
  def headers_names=(val); end
  def max_number_of_devices; end
  def max_number_of_devices=(val); end
  def omniauth_prefix; end
  def omniauth_prefix=(val); end
  def redirect_whitelist; end
  def redirect_whitelist=(val); end
  def remove_tokens_after_password_reset; end
  def remove_tokens_after_password_reset=(val); end
  def require_client_password_reset_token; end
  def require_client_password_reset_token=(val); end
  def self.batch_request_buffer_throttle; end
  def self.batch_request_buffer_throttle=(val); end
  def self.bypass_sign_in; end
  def self.bypass_sign_in=(val); end
  def self.change_headers_on_each_request; end
  def self.change_headers_on_each_request=(val); end
  def self.check_current_password_before_update; end
  def self.check_current_password_before_update=(val); end
  def self.cookie_attributes; end
  def self.cookie_attributes=(val); end
  def self.cookie_enabled; end
  def self.cookie_enabled=(val); end
  def self.cookie_name; end
  def self.cookie_name=(val); end
  def self.default_callbacks; end
  def self.default_callbacks=(val); end
  def self.default_confirm_success_url; end
  def self.default_confirm_success_url=(val); end
  def self.default_password_reset_url; end
  def self.default_password_reset_url=(val); end
  def self.enable_standard_devise_support; end
  def self.enable_standard_devise_support=(val); end
  def self.headers_names; end
  def self.headers_names=(val); end
  def self.max_number_of_devices; end
  def self.max_number_of_devices=(val); end
  def self.omniauth_prefix; end
  def self.omniauth_prefix=(val); end
  def self.railtie_helpers_paths; end
  def self.railtie_namespace; end
  def self.railtie_routes_url_helpers(include_path_helpers = nil); end
  def self.redirect_whitelist; end
  def self.redirect_whitelist=(val); end
  def self.remove_tokens_after_password_reset; end
  def self.remove_tokens_after_password_reset=(val); end
  def self.require_client_password_reset_token; end
  def self.require_client_password_reset_token=(val); end
  def self.send_confirmation_email; end
  def self.send_confirmation_email=(val); end
  def self.setup(&block); end
  def self.table_name_prefix; end
  def self.token_cost; end
  def self.token_cost=(val); end
  def self.token_lifespan; end
  def self.token_lifespan=(val); end
  def self.use_relative_model_naming?; end
  def send_confirmation_email; end
  def send_confirmation_email=(val); end
  def token_cost; end
  def token_cost=(val); end
  def token_lifespan; end
  def token_lifespan=(val); end
end
class DeviseTokenAuth::Engine < Rails::Engine
end
module Anonymous_Module_40
end
module Anonymous_Module_41
end
module DeviseTokenAuth::Controllers
end
module DeviseTokenAuth::Controllers::Helpers
  def self.define_helpers(mapping); end
  extend ActiveSupport::Concern
end
module DeviseTokenAuth::Controllers::Helpers::ClassMethods
  def devise_token_auth_group(group_name, opts = nil); end
  def log_process_action(payload); end
end
module DeviseTokenAuth::Controllers::UrlHelpers
  def self.define_helpers(mapping); end
end
module DeviseTokenAuth::Url
  def self.generate(url, params = nil); end
  def self.whitelisted?(url); end
end
class DeviseTokenAuth::Url::Wildcat
  def initialize(str); end
  def match(str); end
  def self.parse_to_regex(str); end
end
module DeviseTokenAuth::Errors
end
class DeviseTokenAuth::Errors::NoResourceDefinedError < StandardError
end
class DeviseTokenAuth::Errors::InvalidModel < StandardError
end
module DeviseTokenAuth::TokenFactory
  def self.client; end
  def self.create(client: nil, lifespan: nil, cost: nil); end
  def self.expiry(lifespan = nil); end
  def self.new; end
  def self.secure_string; end
  def self.token; end
  def self.token_hash(token, cost = nil); end
  def self.token_hash_is_token?(token_hash, token); end
  def self.valid_token_hash?(token_hash); end
end
class DeviseTokenAuth::TokenFactory::Token < Struct
  def clear!; end
  def client; end
  def client=(_); end
  def expiry; end
  def expiry=(_); end
  def present?; end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
  def token; end
  def token=(_); end
  def token_hash; end
  def token_hash=(_); end
end
module DeviseTokenAuth::Concerns::User
  def build_auth_header(token, client = nil); end
  def build_auth_url(base_url, args); end
  def clean_old_tokens; end
  def confirmed?; end
  def create_new_auth_token(client = nil); end
  def destroy_expired_tokens; end
  def extend_batch_buffer(token, client); end
  def max_client_tokens_exceeded?; end
  def remove_tokens_after_password_reset; end
  def self.tokens_match?(token_hash, token); end
  def send_confirmation_notification?; end
  def should_remove_tokens_after_password_reset?; end
  def token_can_be_reused?(token, client); end
  def token_is_current?(token, client); end
  def token_validation_response; end
  def update_auth_header(token, client = nil); end
  def valid_token?(token, client = nil); end
  extend ActiveSupport::Concern
end
module DeviseTokenAuth::Concerns::ActiveRecordSupport
  extend ActiveSupport::Concern
end
module DeviseTokenAuth::Concerns::ActiveRecordSupport::ClassMethods
  def dta_find_by(attrs = nil); end
end
module DeviseTokenAuth::Concerns::TokensSerialization
  def dump(object); end
  def load(json); end
  def serialize_updated_at(token); end
  extend DeviseTokenAuth::Concerns::TokensSerialization
end
module DeviseTokenAuth::Concerns::UserOmniauthCallbacks
  def email_provider?; end
  def sync_uid; end
  extend ActiveSupport::Concern
end
class DeviseTokenAuthEmailValidator < ActiveModel::EachValidator
  def email_invalid_message; end
  def self.validate?(email); end
  def validate_each(record, attribute, value); end
end
module DeviseTokenAuth::Concerns::ResourceFinder
  def database_adapter; end
  def find_resource(field, value); end
  def get_case_insensitive_field_from_resource_params(field); end
  def provider; end
  def resource_class(m = nil); end
  extend ActiveSupport::Concern
  include DeviseTokenAuth::Controllers::Helpers
end
module DeviseTokenAuth::Concerns::SetUserByToken
  def auth_header_from_batch_request; end
  def is_batch_request?(user, client); end
  def refresh_headers; end
  def set_cookie(auth_header); end
  def set_request_start; end
  def set_user_by_token(mapping = nil); end
  def update_auth_header; end
  extend ActiveSupport::Concern
  include DeviseTokenAuth::Concerns::ResourceFinder
end
class DeviseTokenAuth::ApplicationController < DeviseController
  def _layout(lookup_context, formats); end
  def blacklisted_redirect_url?(redirect_url); end
  def build_redirect_headers(access_token, client, redirect_header_options = nil); end
  def confirmable_enabled?; end
  def json_api?; end
  def params_for_resource(resource); end
  def recoverable_enabled?; end
  def render_error(status, message, data = nil); end
  def resource_class(m = nil); end
  def resource_data(opts = nil); end
  def resource_errors; end
  def self.__callbacks; end
  def self._routes; end
  def self._wrapper_options; end
  def self.helpers_path; end
  def self.middleware_stack; end
  def success_message(name, email); end
  extend DeviseTokenAuth::Controllers::Helpers::ClassMethods
  include ActionDispatch::Routing::UrlFor
  include Anonymous_Module_42
  include DeviseTokenAuth::Concerns::ResourceFinder
  include DeviseTokenAuth::Concerns::SetUserByToken
  include DeviseTokenAuth::Controllers::Helpers
end
module Anonymous_Module_42
  def _generate_paths_by_default; end
  def _routes; end
  def self._routes; end
  def self.full_url_for(options); end
  def self.optimize_routes_generation?; end
  def self.polymorphic_path(record_or_hash_or_array, options = nil); end
  def self.polymorphic_url(record_or_hash_or_array, options = nil); end
  def self.route_for(name, *args); end
  def self.url_for(options); end
  def self.url_options; end
  extend ActiveSupport::Concern
  extend Anonymous_Module_40
  extend Anonymous_Module_41
  include ActionDispatch::Routing::UrlFor
  include Anonymous_Module_40
  include Anonymous_Module_41
end
class DeviseTokenAuth::TokenValidationsController < DeviseTokenAuth::ApplicationController
  def _layout(lookup_context, formats); end
  def render_validate_token_error; end
  def render_validate_token_success; end
  def self.__callbacks; end
  def self._wrapper_options; end
  def self.helpers_path; end
  def self.middleware_stack; end
  def validate_token; end
  include Anonymous_Module_42
end
class DeviseTokenAuth::OmniauthCallbacksController < DeviseTokenAuth::ApplicationController
  def _layout(lookup_context, formats); end
  def assert_is_devise_resource!; end
  def assign_provider_attrs(user, auth_hash); end
  def assign_whitelisted_params?; end
  def auth_hash; end
  def auth_origin_url; end
  def auth_params; end
  def create_auth_params; end
  def default_devise_mapping; end
  def fallback_render(text); end
  def get_devise_mapping; end
  def get_redirect_route(devise_mapping); end
  def get_resource_from_auth_hash; end
  def handle_new_resource; end
  def omniauth_failure; end
  def omniauth_params; end
  def omniauth_success; end
  def omniauth_window_type; end
  def redirect_callbacks; end
  def render_data(message, data); end
  def render_data_or_redirect(message, data, user_data = nil); end
  def render_error_not_allowed_auth_origin_url; end
  def resource_class(mapping = nil); end
  def resource_name; end
  def self.__callbacks; end
  def self._wrapper_options; end
  def self.helpers_path; end
  def self.middleware_stack; end
  def set_random_password; end
  def set_token_on_resource; end
  def unsafe_auth_origin_url; end
  def validate_auth_origin_url_param; end
  def whitelisted_params; end
  include Anonymous_Module_42
end
class DeviseTokenAuth::PasswordsController < DeviseTokenAuth::ApplicationController
  def _layout(lookup_context, formats); end
  def create; end
  def edit; end
  def password_resource_params; end
  def render_create_error(errors); end
  def render_create_error_missing_email; end
  def render_create_error_missing_redirect_url; end
  def render_create_success; end
  def render_edit_error; end
  def render_error_not_allowed_redirect_url; end
  def render_not_found_error; end
  def render_update_error; end
  def render_update_error_missing_password; end
  def render_update_error_password_not_required; end
  def render_update_error_unauthorized; end
  def render_update_success; end
  def require_client_password_reset_token?; end
  def reset_password_token_as_raw?(recoverable); end
  def resource_params; end
  def resource_update_method; end
  def self.__callbacks; end
  def self._wrapper_options; end
  def self.helpers_path; end
  def self.middleware_stack; end
  def update; end
  def validate_redirect_url_param; end
  include Anonymous_Module_42
end
class DeviseTokenAuth::SessionsController < DeviseTokenAuth::ApplicationController
  def _layout(lookup_context, formats); end
  def create; end
  def destroy; end
  def get_auth_params; end
  def new; end
  def render_create_error_account_locked; end
  def render_create_error_bad_credentials; end
  def render_create_error_not_confirmed; end
  def render_create_success; end
  def render_destroy_error; end
  def render_destroy_success; end
  def render_new_error; end
  def resource_params; end
  def self.__callbacks; end
  def self._wrapper_options; end
  def self.helpers_path; end
  def self.middleware_stack; end
  def valid_params?(key, val); end
  include Anonymous_Module_42
end
class DeviseTokenAuth::UnlocksController < DeviseTokenAuth::ApplicationController
  def _layout(lookup_context, formats); end
  def after_unlock_path_for(resource); end
  def create; end
  def render_create_error(errors); end
  def render_create_error_missing_email; end
  def render_create_success; end
  def render_not_found_error; end
  def render_show_error; end
  def resource_params; end
  def self.__callbacks; end
  def self._wrapper_options; end
  def self.helpers_path; end
  def self.middleware_stack; end
  def show; end
  include Anonymous_Module_42
end
class DeviseTokenAuth::ConfirmationsController < DeviseTokenAuth::ApplicationController
  def _layout(lookup_context, formats); end
  def create; end
  def redirect_url; end
  def render_create_error_missing_email; end
  def render_create_success; end
  def render_not_found_error; end
  def resource_params; end
  def self._wrapper_options; end
  def self.helpers_path; end
  def self.middleware_stack; end
  def show; end
  include Anonymous_Module_42
end
class DeviseTokenAuth::RegistrationsController < DeviseTokenAuth::ApplicationController
  def _layout(lookup_context, formats); end
  def account_update_params; end
  def active_for_authentication?; end
  def build_resource; end
  def create; end
  def destroy; end
  def render_create_error; end
  def render_create_error_missing_confirm_success_url; end
  def render_create_error_redirect_url_not_allowed; end
  def render_create_success; end
  def render_destroy_error; end
  def render_destroy_success; end
  def render_update_error; end
  def render_update_error_user_not_found; end
  def render_update_success; end
  def resource_update_method; end
  def self.__callbacks; end
  def self._wrapper_options; end
  def self.helpers_path; end
  def self.middleware_stack; end
  def sign_up_params; end
  def update; end
  def validate_account_update_params; end
  def validate_post_data(which, message); end
  def validate_sign_up_params; end
  include Anonymous_Module_42
end
module DeviseTokenAuth::Concerns::ConfirmableSupport
  def email_value_in_database; end
  extend ActiveSupport::Concern
end
module DeviseTokenAuth::Concerns::MongoidSupport
  def as_json(options = nil); end
  extend ActiveSupport::Concern
end
module DeviseTokenAuth::Concerns::MongoidSupport::ClassMethods
  def dta_find_by(attrs = nil); end
end
