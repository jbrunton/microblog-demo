module TireHelper

  def search_for(*args,&block)
    tire.__send__(:search, *args, &block)
  end

  def use_tire?
    Settings.search.use_tire?
  end

end
