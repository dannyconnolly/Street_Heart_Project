class ProductsController < ApplicationController
  before_filter :authorize, :except => :show

  # GET /products
  # GET /products.xml
  def index
    @products = Product.search(params[:search_query])

    respond_to do |format|
      format.html   # index.html.erb
      format.xml { render :xml => @products }
    end
  end

  #GET /products/1
  # GET /products/1.xml
  def show
    @product = Product.find(params[:id])
    @wishlist = current_wishlist

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @product }
    end
  end

   def get_recommendations
    #get the products that have the most common tags to the specified product id
    @products = Product.find_by_sql("SELECT p.*, COUNT(t2.name) as rank FROM tags AS t
INNER JOIN tags AS t2
ON t2.name = t.name
INNER JOIN products AS p
ON p.id = t2.product_id
WHERE t.product_id = " + params[:id] + " AND t2.product_id <> " + params[:id] + "
ORDER BY rank desc LIMIT 4")
  end
  #GET /products/1
  # GET /products/1.xml
  def show_recommendations
    #get recommendations for this product
     @products = get_recommendations

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @products }
    end
  end

  # GET /products/new
  # GET /products/new.xml
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.xml
  def create
    @product = current_user.products.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to(@product, :notice => 'Product was successfully created.') }
        format.xml { render :xml => @product, :status => :created, :location => @product }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.xml
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to(@product, :notice => 'Product was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.xml
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml { head :ok }
    end
  end

  def who_bought
    @product =Product.find(params[:id])
    respond_to do |format|
      format.atom
      format.xml { render :xml => @product }

    end
  end


end
