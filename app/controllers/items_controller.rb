class ItemsController < ApplicationController

  def index
    if logged_in?
      @user = User.find(params[:user_id])
      @list = List.find(params[:list_id])
      @items = @list.items
      @item = @list.items.build
      @contributors = @list.contributors
      @contributor = @list.contributors.build
      @notice = params[:notice]
      @type = params[:type]
      respond_to do |format|
        format.html
      end
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.find(params[:user_id])
    @list = List.find(params[:list_id])
    @item = @list.items.create(params[:item])
    respond_to do |format|
      format.js
    end
    #respond_to do |format|
    #  format.html { redirect_to user_list_path @user, @list, :notice => 'Added new item' }
    #  format.js
    #end
  end

  def destroy
    @item = Item.find(params[:id])
    @list = @item.list
    @user = @list.user
    @item.destroy
    #@user = User.find(params[:user_id])
    #@list = List.find(params[:list_id])
    respond_to do |format|
      format.js
      #format.html { redirect_to(user_list_path @user, @list, :notice => 'Item was deleted', :type => :success) }
      #format.xml  { head :ok }
    end
  end


end
