class FriendshipsController < ApplicationController


  def create
   @friendship = User.find(@logged_in).friendships.build(:friend_id => params[:friend_id])
   @friendship.created_at = Time.zone.now.to_datetime
  if @friendship.save
    flash[:notice] = "Added pair."
    redirect_to  users_path
  else
    flash[:error] = "Unable to add pair."
    redirect_to  users_path
  end
  end

   def index
    @friendships = Friendship.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @friendships }
    end
   end
    def show

      @friendships1 = Friendship.find_all_by_user_id_and_friend_id(@logged_in,params[:id])



       puts("empty")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @friendships1 }
    end
  end



  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Successfully destroyed friendship."
    redirect_to  users_path
  end
end
