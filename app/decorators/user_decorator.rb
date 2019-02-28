class UserDecorator < BaseDecorator
  def link
    h.link_to self.name, routes.user_path(self)
  end
  def edit_link
    h.link_to "Edit", routes.edit_user_path(self)
  end
  def delete_link
    h.link_to "Delete", routes.user_path(self), data: { confirm: 'Are you sure?', method: 'delete' }
  end
end
