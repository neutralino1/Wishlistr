class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @list = List.find(params[:list_id])
    @item = @list.items.create(params[:item])
    redirect_to user_list_path @user, @list, :notice => 'Added new item'
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    @user = User.find(params[:user_id])
    @list = List.find(params[:list_id])

    respond_to do |format|
      format.html { redirect_to(user_list_path @user, @list, :notice => 'Item was deleted', :type => :success) }
      format.xml  { head :ok }
    end
  end


end
