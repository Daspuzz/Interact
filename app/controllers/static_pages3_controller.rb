class StaticPages3Controller < ApplicationController
  def contact
  end

  def about
    render 'static_pages3/about'
  end
end
