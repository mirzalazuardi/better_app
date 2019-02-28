module ViewHelpers
  def h
    ActionController::Base.helpers
  end

  def routes
    Rails.application.routes.url_helpers
  end
end
