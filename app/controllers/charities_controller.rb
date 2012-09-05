class CharitiesController < ApplicationController
  # GET /charities
  # GET /charities.json
  def index
    @charities = Charity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @charities }
    end
  end

  # GET /charities/1
  # GET /charities/1.json
  def show
    @charity = Charity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @charity }
    end
  end
  
  # GET /charities/1
  # GET /charities/1.json
  # Show the wishlist for a particular charity
  def list
    @charity = Charity.find(:first, :conditions => [ "lower(short_name) = ?", params[:short_name].downcase ])
    
    if @charity.nil?
      redirect_to '/not_found/' + params[:short_name]
    else
      @donation = Donation.new
      @wishlist_items = WishlistItem.find(:all, :conditions => ["charity_id = ?", @charity.id])
      respond_to do |format|
        format.html # list.html.erb
        format.json { render json: @charity }
      end
    end
  end
  
  # GET /charities/1
  # GET /charities/1.json
  # Show the wishlist for a particular charity
  def return
    @charity = Charity.find(:first, :conditions => [ "lower(short_name) = ?", params[:short_name].downcase ])
    if @charity.nil?
      redirect_to '/not_found/' + params[:short_name]
    else
      @donation = Donation.find(params[:donation])
      @donation.processed = true
      @donation.save
      redirect_to '/list/' + @charity.short_name + '/thanks?donation=' + @donation.id.to_s
    end
  end
  
  # GET /charities/1
  # GET /charities/1.json
  # Show the wishlist for a particular charity
  def thanks
    @charity = Charity.find(:first, :conditions => [ "lower(short_name) = ?", params[:short_name].downcase ])
    
    if @charity.nil?
      redirect_to '/not_found/' + params[:short_name]
    else
      @donation = Donation.find(params[:donation])

      respond_to do |format|
        format.html # list.html.erb
        format.json { render json: @charity }
      end
    end
  end

  # GET /charities/new
  # GET /charities/new.json
  def new
    @charity = Charity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @charity }
    end
  end

  # GET /charities/1/edit
  def edit
    @charity = Charity.find(params[:id])
  end

  # POST /charities
  # POST /charities.json
  def create
    @charity = Charity.new(params[:charity])

    respond_to do |format|
      if @charity.save
        format.html { redirect_to @charity, notice: 'Charity was successfully created.' }
        format.json { render json: @charity, status: :created, location: @charity }
      else
        format.html { render action: "new" }
        format.json { render json: @charity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /charities/1
  # PUT /charities/1.json
  def update
    @charity = Charity.find(params[:id])

    respond_to do |format|
      if @charity.update_attributes(params[:charity])
        format.html { redirect_to @charity, notice: 'Charity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @charity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charities/1
  # DELETE /charities/1.json
  def destroy
    @charity = Charity.find(params[:id])
    @charity.destroy

    respond_to do |format|
      format.html { redirect_to charities_url }
      format.json { head :no_content }
    end
  end
end
