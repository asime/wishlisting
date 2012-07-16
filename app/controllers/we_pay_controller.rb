class WePayController < ApplicationController
  include WepayRails::Payments

  def test
  end
  
  def checkout
    #Get our real checkout parameters to use

    checkout_params = {
      :amount => 25,
      :short_description => 'Wishlisting',
      :long_description => 'Wishlisting for a test client',
    }

    # Finally, send the user off to wepay so you can get paid! - CASH MONEY
    init_checkout_and_send_user_to_wepay(checkout_params)
  end
end
