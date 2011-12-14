class WishlistsController < ApplicationController
  before_filter :authenticate
  before_filter :authorize, :only => :index
  # GET /wishlists
  # GET /wishlists.xml
  def index
    @wishlists = Wishlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wishlists }
    end
  end

  # GET /wishlists/1
  # GET /wishlists/1.xml
  def show
    @wishlist = Wishlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wishlist }
    end
  end

  # GET /wishlists/new
  # GET /wishlists/new.xml
  def new
    @wishlist = Wishlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wishlist }
    end
  end

  # GET /wishlists/1/edit
  def edit
    @wishlist = Wishlist.find(params[:id])
  end

  # POST /wishlists
  # POST /wishlists.xml
  def create
    @wishlist = Wishlist.new(params[:wishlist])

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to(@wishlist, :notice => 'Wishlist was successfully created.') }
        format.xml  { render :xml => @wishlist, :status => :created, :location => @wishlist }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wishlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wishlists/1
  # PUT /wishlists/1.xml
  def update
    @wishlist = Wishlist.find(params[:id])

    respond_to do |format|
      if @wishlist.update_attributes(params[:wishlist])
        format.html { redirect_to(@wishlist, :notice => 'Wishlist was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wishlist.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlists/1
  # DELETE /wishlists/1.xml
  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy

    respond_to do |format|
      format.html { redirect_to(wishlists_url) }
      format.xml  { head :ok }
    end
  end
end
