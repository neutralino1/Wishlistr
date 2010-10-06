class HomeController < ApplicationController
  def index
    if logged_in?
      @user = self.current_user
      @lists = @user.lists
      @contribs = List.find(:all, :include => :contributors, :conditions => ['contributors.username = ?', @user.login])
    end
  end

end
