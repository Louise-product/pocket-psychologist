class ApplicationController < ActionController::Base
  before_action :authenticate_user!

    def after_sign_in_path_for(resource)
      #if user.completed
        # super
      #else

      # end
      return edit_user_registration_path
    end

end
