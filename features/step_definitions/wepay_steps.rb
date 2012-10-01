Given /^I have a wepay object for wishlisting$/ do
  # application settings
  @@account_id = "98354"
  client_id = "130636"
  client_secret = 'e197c305cb'

  # set _use_stage to false for live environments
  @@wepay = WePay.new(client_id, client_secret, _use_stage = true)
end

Given /^I have an access code already$/ do
  @@access_token = '9fe2dcdca5ec753dd17dba95e22ca3218dc796c002c4e987d9293f67febd5ba5'
end

When /^I create a checkout$/ do
  # create the checkout 
  response = @@wepay.call('/checkout/create', @@access_token, {
      :account_id         => @@account_id,
      :amount             => '24.95',
      :short_description  => 'A donation to a wishlisting client',
      :type               => 'DONATION',
      :mode               => 'regular',
      :redirect_uri       => 'http://localhost:3000/list/AHIP/return?donation=1',
      :app_fee            => '0.2495',
      :fee_payer          => 'Payee',
      :prefill_info       => {:name => "Bill Clerico",:email => "Arin@ArinSime.com",:address => 'PO Box 156',:city => 'Crozet',:state => 'VA',:zip => '22932'}
      
  })
  puts "WEPAY RESPONSE:"
  puts "___________________________________"
  puts response
  puts "___________________________________"
  puts "END OF WEPAY RESPONSE"
  @@checkout_id = response['checkout_id']
  @@checkout_uri = response['checkout_uri']
  puts "Checkout id: #{@@checkout_id}"
  puts "Checkout uri: #{@@checkout_uri}"
end

Then /^I am redirected to the wepay page for payment$/ do
  visit @@checkout_uri
end

When /^I enter my payment$/ do
  #Already entered name info using prefill
  fill_in "number", :with => '4111111111111111'
  fill_in "expirationMonth", :with => '11'
  fill_in "expirationYear", :with => '2014'
  fill_in "cvv2", :with => '111'
  fill_in "address[zip]", :with => '22932'
  click_button "Next"
end

And /^I confirm my payment$/ do
  #On the next page the email address should already be there, just click through
  #uncheck "save_info"
  click_button "Confirm"
end

Then /^I am redirected back to wishlisting\.org$/ do
  current_path.should have_content 'thanks'
  current_path.should have_content 'AHIP'
end