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

    #respond_to do |format|
      if @donation.save
        #Hardcoded to test URL
        @url_to_donate = "https://secure.donortownsquare.com/SSL/process.aspx?ai=1349&qs=TYBNV&amt=" + @donation.amount.to_s + "&fn=" + @donation.fname + "&ln=" + @donation.lname + "&s1=" + @donation.street1 + "&c=" + @donation.city + "&s=" + @donation.state + "&z=" + @donation.postal + "&e=" + @donation.email + "&ret=http%3A%2F%2Flocalhost%3A3000%2Flist%2F1%2Freturn%3Fdonation%3D" + @donation.id.to_s
        puts "Donation URL: " + @url_to_donate
        redirect_to @url_to_donate
        
        #Hardcoded to AHIP url for the moment
        #redirect_to "http://www.donortownsquare.com/donate_redir.aspx?ai=1358&qs=NMGLN"
        #format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
        #format.json { render json: @donation, status: :created, location: @donation }
      else
        #format.html { render action: "new" }
        #format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    #end
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
