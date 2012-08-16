class WishlistItemsController < ApplicationController
  # GET /wishlist_items
  # GET /wishlist_items.json
  def index
    @wishlist_items = WishlistItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wishlist_items }
    end
  end

  # GET /wishlist_items/1
  # GET /wishlist_items/1.json
  def show
    @wishlist_item = WishlistItem.find(params[:id])
    
    @before_images = Image.find(:all, :conditions => { :wishlist_item_id => params[:id], :image_type => false })
	#@before_images = Image.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wishlist_item }
    end
  end

  # GET /wishlist_items/new
  # GET /wishlist_items/new.json
  def new
    @wishlist_item = WishlistItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wishlist_item }
    end
  end

  # GET /wishlist_items/1/edit
  def edit
    @wishlist_item = WishlistItem.find(params[:id])
  end

  # POST /wishlist_items
  # POST /wishlist_items.json
  def create
    @wishlist_item = WishlistItem.new(params[:wishlist_item])

    respond_to do |format|
      if @wishlist_item.save
        format.html { redirect_to @wishlist_item, notice: 'Wishlist item was successfully created.' }
        format.json { render json: @wishlist_item, status: :created, location: @wishlist_item }
      else
        format.html { render action: "new" }
        format.json { render json: @wishlist_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wishlist_items/1
  # PUT /wishlist_items/1.json
  def update
    @wishlist_item = WishlistItem.find(params[:id])

    respond_to do |format|
      if @wishlist_item.update_attributes(params[:wishlist_item])
        format.html { redirect_to @wishlist_item, notice: 'Wishlist item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wishlist_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wishlist_items/1
  # DELETE /wishlist_items/1.json
  def destroy
    @wishlist_item = WishlistItem.find(params[:id])
    @wishlist_item.destroy

    respond_to do |format|
      format.html { redirect_to wishlist_items_url }
      format.json { head :no_content }
    end
  end

  # POST For handling the upload of before images to go with the wishlist item
  def upload_before_image
	@wishlist_item = WishlistItem.find(params[:id])

	@new_image = params[:before_image]
	@uploaded_file = Cloudinary::Uploader.upload(@new_image)

	@new_before_image = Image.new
	@new_before_image.wishlist_item_id = @wishlist_item.id
	@new_before_image.image = @uploaded_file["url"].split("/").last
	@new_before_image.image_type = 0 #Before image
	@new_before_image.description = @uploaded_file["url"]
	@new_before_image.save

	redirect_to @wishlist_item, :notice => "Image uploaded successfully"
  end
end
