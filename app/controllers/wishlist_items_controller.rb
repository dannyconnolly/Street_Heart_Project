class WishlistItemsController < ApplicationController
  before_filter :authenticate
  skip_before_filter :authorize, :only => [:create, :destroy]

  # GET /wishlist_items
  # GET /wishlist_items.xml
  def index
    @wishlist_items = WishlistItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @wishlist_items }
    end
  end

  # GET /wishlist_items/1
  # GET /wishlist_items/1.xml
  def show
    @wishlist_item = WishlistItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @wishlist_item }
    end
  end

  # GET /wishlist_items/new
  # GET /wishlist_items/new.xml
  def new
    @wishlist_item = WishlistItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @wishlist_item }
    end
  end

  # GET /wishlist_items/1/edit
  def edit
    @wishlist_item = WishlistItem.find(params[:id])
  end

  # POST /wishlist_items
  # POST /wishlist_items.xml
  def create
    @wishlist = current_wishlist
    product = Product.find(params[:product_id])
    @wishlist_item = @wishlist.wishlist_items.build(:product => product)

    respond_to do |format|
      if @wishlist_item.save
        format.html { redirect_to(store_url, :notice => 'Wishlist item was successfully created.') }
        format.xml { render :xml => @wishlist_item, :status => :created, :location => @wishlist_item }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @wishlist_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wishlist_items/1
  # PUT /wishlist_items/1.xml
  def update
    @wishlist_item = WishlistItem.find(params[:id])

    respond_to do |format|
      if @wishlist_item.update_attributes(params[:wishlist_item])
        format.html { redirect_to(@wishlist_item, :notice => 'Wishlist item was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @wishlist_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlist_items/1
  # DELETE /wishlist_items/1.xml
  def destroy
    @wishlist_item = WishlistItem.find(params[:id])
    @wishlist_item.destroy

    respond_to do |format|
      format.html { redirect_to(store_path, :notice => 'Item has been removed from your wishlist.') }
      format.xml { head :ok }
    end
  end


end
