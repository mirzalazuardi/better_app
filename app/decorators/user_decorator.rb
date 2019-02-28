class UserDecorator < BaseDecorator
  def edit_user_link
    h.link_to "Edit", routes.edit_user_path(self.id)
  end
end
