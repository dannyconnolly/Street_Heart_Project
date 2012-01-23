#
#
#  @reference Agile Web Development with Rails fourth edition page 183
#
#
class UsersController < ApplicationController
  before_filter :authenticate, :except => [:new, :create, :your_profile]
  before_filter :authorize, :only => [:index, :destroy]

  # GET /users
  # GET /users.xml
  def index
    @users = User.order(:name).paginate :page=>params[:page], :per_page => 10

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @cart = current_cart
    @wishlist = current_wishlist
    @user = current_user
    @categories = Category.all
    @orders = Order.where("user_id = #{current_user.id}")

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @user }
    end
  end

  def your_profile
    redirect_to :action => "show", :id => current_user.id
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @categories = Category.all
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(login_url,
                                  :notice => "User #{@user.name} was successfully created") }
        format.xml { render :xml => @user,
                            :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @user.errors,
                            :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to :controller => "users", :action => "your_profile", :notice => "User #{@user.name} was successfully updated." }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    begin
      @user.destroy
      flash[:notice] = "User #{@user.name} deleted."
    rescue Exception => e
      flash[:notice] = e.message
    end

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml { head :ok }
    end
  end

  private
  # @reference http://ruby.railstutorial.org/chapters/updating-showing-and-deleting-users#code:correct_user_before_filter
  def authenticate
    access_denied unless logged_in?
  end
  # @reference http://ruby.railstutorial.org/chapters/updating-showing-and-deleting-users#code:correct_user_before_filter
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

end
