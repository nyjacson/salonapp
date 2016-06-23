class StaticPagesController < ApplicationController
  def home
      @shopinfo = Shopinfo.all
      @shopbranch = Shopbranch.all
  end
  def toku1
  end
  def toku2
  end
end
