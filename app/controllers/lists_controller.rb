class ListsController < ApplicationController
  def new
    @list = List.new
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html
      format.xml { render :xml => @list }
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:user_id])
      @list = List.find(params[:id])
      @contributors = @list.contributors
      isCont = false
      @contributors.each do |c|
        if current_user.login == c.username
          isCont = true
          break
        end
      end
      if current_user == @user
        @owns = true
      elsif isCont
        @owns = false
      else redirect_to root_path
      end
      @itemsByOwner = []
      @itemsByOthers = []
      @list.items.each do |i|
        if i.addedby == @user.login
          @itemsByOwner += [i]
        else
          @itemsByOthers += [i]
        end
      end
      @item = @list.items.build
      @contributor = @list.contributors.build
      @notice = params[:notice]
      @type = params[:type]
      respond_to do |format|
        format.html {} # show.html.erb
        format.xml  { render :xml => @list }
      end
    else
      redirect_to root_path
    end
  end

  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.create(params[:list])
    redirect_to root_path, :notice => 'Created new list'
  end

  def edit
    @list = List.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @list = List.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to root_path}#(@list, :notice => 'List was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.js
      #format.html { redirect_to(root_path, :notice => 'List was deleted', :type => :success) }
      #format.xml  { head :ok }
    end
  end

end
