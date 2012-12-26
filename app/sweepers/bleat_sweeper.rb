class BleatSweeper < ActionController::Caching::Sweeper
  observe Bleat
  
  def after_create(bleat)
    expire_cache_for(bleat)
  end
 
  def after_destroy(bleat)
    expire_cache_for(bleat)
  end
 
  private
  def expire_cache_for(bleat)
    expire_action(:controller => 'users', :action => 'show', :id => bleat.user.id)
  end
end
