class Users::PasswordsController < Devise::PasswordsController
  protected
    def after_resetting_password_path_for(user)
      signed_in_root_path(user)
    end
end