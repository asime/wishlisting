class AddSocialToCharity < ActiveRecord::Migration
  def change
    add_column :charities, :tweet_text, :string
    add_column :charities, :twitter_username, :string
    add_column :charities, :facebook_url, :string
  end
end
