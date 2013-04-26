require 'net/http'
require 'uri'

class DonationsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show, :create]
  
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
      #@base_url = root_url.to_s
      #@base_url.gsub!("http://","")
      #@base_url.gsub!("/","")
      #if (@base_url.include?"localhost") && (!@base_url.include?"3000")
      #  @base_url = @base_url + "%3A3000"
      #end
      #@ret_url = "http%3A%2F%2F" + @base_url +"%2Flist%2F" + URI.escape(@charity.short_name) + "%2Freturn%3Fdonation%3D" + @donation.id.to_s
      #@url_to_donate = @charity.dts_url + "&amt=" + URI.escape(@donation.amount.to_s) + "&fn=" + URI.escape(@donation.fname) + "&ln=" + URI.escape(@donation.lname) + "&s1=" + URI.escape(@donation.street1) + "&s2=" + URI.escape(@donation.street2) + "&c=" + URI.escape(@donation.city) + "&s=" + URI.escape(@donation.state) + "&z=" + URI.escape(@donation.postal) + "&e=" + URI.escape(@donation.email) + "&ret=" + @ret_url
      #puts "Donation URL: " + @url_to_donate
      #redirect_to @url_to_donate
      
      #Send the user to the Click and Pledge Form as a Service
      url= URI.parse('https://paas.cloud.clickandpledge.com/PaymentService.svc?wsdl')
      puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      puts "Going to post to: #{url}"
      request = Net::HTTP::Post.new(url.path)
      request.add_field 'Content-Type', 'application/xml'
      request.body = %Q{'<CnPAPI xmlns="urn:APISchema.xsd">
        <Version>12</Version> 
        <Engine>
          <Request>
            <Operation>
              <OperationType>Transaction</OperationType>
              <IPAddress>75.115.250.126</IPAddress>
            </Operation>
            <Authentication>
              <AccountGuid>064a1d2b-0743-457a-82d5-8b631697e5d6</AccountGuid>
              <AccountID>24767</AccountID>
            </Authentication>
            <Order>
              <OrderMode>Test</OrderMode>
              <CardHolder>
                <BillingInformation>
                  <BillingFirstName>Arin</BillingFirstName>
                  <BillingMI>W</BillingMI>
                  <BillingLastName>Sime</BillingLastName>
                  <BillingEmail>Arin@ArinSime.com</BillingEmail>
                  <BillingPhone>123.456.7890</BillingPhone>
                </BillingInformation>
                <BillingAddress>
                  <BillingAddress1>Post Office Box 1000</BillingAddress1>
                  <BillingAddress2></BillingAddress2>
                  <BillingAddress3></BillingAddress3>
                  <BillingCity>Blacksburg</BillingCity>
                  <BillingStateProvince>VA</BillingStateProvince>
                  <BillingPostalCode>12346-4563</BillingPostalCode>
                  <BillingCountryCode>840</BillingCountryCode>
                </BillingAddress>
                <PaymentMethod>
                  <PaymentType>CreditCard</PaymentType>
                  <CreditCard>
                    <NameOnCard>Arin Sime</NameOnCard>
                    <CardNumber>4111111111111111</CardNumber>
                    <Cvv2>123</Cvv2>
                    <ExpirationDate>04/15</ExpirationDate>
                  </CreditCard>
                </PaymentMethod>
              </CardHolder>
              <OrderItemList>
                <OrderItem>
                  <ItemID>1</ItemID>
                  <ItemName>Donation</ItemName>
                  <Quantity>1</Quantity>
                  <UnitPrice>1000</UnitPrice>
                  <UnitDeductible>1000</UnitDeductible>
                </OrderItem>
              </OrderItemList>
              <Receipt>
      		 			<SendReceipt>true</SendReceipt>
      					<WID>64906</WID>              
              </Receipt>
              <Transaction>
                <TransactionType>Authorize</TransactionType>
                <CurrentTotals>
                  <TotalDeductible>1000</TotalDeductible>
                  <Total>1000</Total>
                </CurrentTotals>
              </Transaction>
            </Order>
          </Request>
        </Engine>
      </CnPAPI>'}
      puts "XML to post:"
      puts request.body
      response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
      puts "Response Received:"
      puts response.inspect
      puts "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
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
