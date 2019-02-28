class UserDecorator < BaseDecorator
  def user_link
    h.link_to self.name, routes.user_path(self)
  end
  def edit_user_link
    h.link_to "Edit", routes.edit_user_path(self)
  end
end
