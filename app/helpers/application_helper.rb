module ApplicationHelper

  def user_privilege_check?
    @article.author == current_user.username
  end

end
