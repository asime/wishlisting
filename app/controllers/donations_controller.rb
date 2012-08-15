class DonationsController < ApplicationController
  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donations }
    end
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
    @donation = Donation.find(params[:id])
    
    if !@donation.charity_id.nil?
      @charity = Charity.find(@donation.charity_id)
    else
      @charity = Charity.new
    end
    
    if !@donation.wishlist_item_id.nil?
      @wishlist_item = WishlistItem.find(@donation.wishlist_item_id)
    else
      @wishlist_item = WishlistItem.new
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donation }
    end
  end

  # GET /donations/new
  # GET /donations/new.json
  def new
    @donation = Donation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donation }
    end
  end

  # GET /donations/1/edit
  def edit
    @donation = Donation.find(params[:id])
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(params[:donation])
    @donation.processed = false
    @charity = Charity.find(@donation.charity_id)

    if @donation.save
      @base_url = root_url.to_s
      @base_url.gsub!("http://","")
      @base_url.gsub!("/","")
      if (@base_url.include?"localhost") && (!@base_url.include?"3000")
        @base_url = @base_url + "%3A3000"
      end
      @ret_url = "http%3A%2F%2F" + @base_url +"%2Flist%2F" + URI.escape(@charity.short_name) + "%2Freturn%3Fdonation%3D" + @donation.id.to_s
      @url_to_donate = @charity.dts_url + "&amt=" + URI.escape(@donation.amount.to_s) + "&fn=" + URI.escape(@donation.fname) + "&ln=" + URI.escape(@donation.lname) + "&s1=" + URI.escape(@donation.street1) + "&s2=" + URI.escape(@donation.street2) + "&c=" + URI.escape(@donation.city) + "&s=" + URI.escape(@donation.state) + "&z=" + URI.escape(@donation.postal) + "&e=" + URI.escape(@donation.email) + "&ret=" + @ret_url
      puts "Donation URL: " + @url_to_donate
      redirect_to @url_to_donate
    else
      render action: "new"
      #format.html { render action: "new" }
      #format.json { render json: @donation.errors, status: :unprocessable_entity }
    end
  end

  # PUT /donations/1
  # PUT /donations/1.json
  def update
    @donation = Donation.find(params[:id])

    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy

    respond_to do |format|
      format.html { redirect_to donations_url }
      format.json { head :no_content }
    end
  end
end
