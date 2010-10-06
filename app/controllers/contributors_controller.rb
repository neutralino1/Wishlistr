class ContributorsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @list = List.find(params[:list_id])
    username = params[:contributor][:username]
    finduser = User.find(:first, :conditions => ['login = ?', username])
    findcont = @list.contributors.find(:first, :conditions => ['username = ?', username])
    if finduser != nil and findcont == nil
      @contributor = @list.contributors.create(params[:contributor])
      note = 'Added new contributor'
      type = :success
    else
      if findcont == nil
        note = 'No such user : ', username
      else
        note = username, ' already contributes to your list'
      end
      type = :fail
    end
    redirect_to user_list_path @user, @list, :notice => note, :type => type
  end

  def destroy
    @contrib = Contributor.find(params[:id])
    @contrib.destroy
    @user = User.find(params[:user_id])
    @list = List.find(params[:list_id])

    respond_to do |format|
      format.html { redirect_to(user_list_path @user, @list, :notice => 'Contributor was removed', :type => :success) }
      format.xml  { head :ok }
    end
  end

end
