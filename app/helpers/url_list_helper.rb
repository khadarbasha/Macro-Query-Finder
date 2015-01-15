module UrlListHelper
  def is_admin
    if current_user.try(:admin?)
    return true
    end
    return false
  end
end
