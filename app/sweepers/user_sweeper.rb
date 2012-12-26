class UserSweeper < ActionController::Caching::Sweeper
  observe User
  
  def after_update(user)
    expire_cache_for(user)
  end
 
  def after_destroy(user)
    expire_cache_for(user)
  end
 
  private
  def expire_cache_for(user)
    expire_action(:controller => 'users', :action => 'show', :id => user.id)
  end
end