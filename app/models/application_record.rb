class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # rescue_from CanCan::AccessDenied do | exception |
  #   redirect_to root_url, alert: exception.message
  # end
end
