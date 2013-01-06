module UsersHelper
  def current_user?(user)
    !user.nil? && user.id == current_user.try(:id)
  end
end
