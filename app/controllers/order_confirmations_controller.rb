class OrderConfirmationsController < ApplicationController
  # GET /order_confirmations
  # GET /order_confirmations.xml
  def index
    @order_confirmations = OrderConfirmation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @order_confirmations }
    end
  end

  # GET /order_confirmations/1
  # GET /order_confirmations/1.xml
  def show
    @order_confirmation = OrderConfirmation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order_confirmation }
    end
  end

  # GET /order_confirmations/new
  # GET /order_confirmations/new.xml
  def new
    @order_confirmation = OrderConfirmation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order_confirmation }
    end
  end

  # GET /order_confirmations/1/edit
  def edit
    @order_confirmation = OrderConfirmation.find(params[:id])
  end

  # POST /order_confirmations
  # POST /order_confirmations.xml
  def create
    @order_confirmation = OrderConfirmation.new(params[:order_confirmation])

    respond_to do |format|
      if @order_confirmation.save
        format.html { redirect_to(@order_confirmation, :notice => 'Order confirmation was successfully created.') }
        format.xml  { render :xml => @order_confirmation, :status => :created, :location => @order_confirmation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order_confirmation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /order_confirmations/1
  # PUT /order_confirmations/1.xml
  def update
    @order_confirmation = OrderConfirmation.find(params[:id])

    respond_to do |format|
      if @order_confirmation.update_attributes(params[:order_confirmation])
        format.html { redirect_to(@order_confirmation, :notice => 'Order confirmation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order_confirmation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /order_confirmations/1
  # DELETE /order_confirmations/1.xml
  def destroy
    @order_confirmation = OrderConfirmation.find(params[:id])
    @order_confirmation.destroy

    respond_to do |format|
      format.html { redirect_to(order_confirmations_url) }
      format.xml  { head :ok }
    end
  end
end
