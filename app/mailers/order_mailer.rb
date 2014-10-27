class OrderMailer < ActionMailer::Base
  default from: "bhupendra@idifysolutions.com"

  def order_placed(order)
  	@order = order 
  	attachments["image.jpg"] = File.read("#{Rails.root}/public/#{order.product.product_images.find_by(main_image: true).image}")
  	mail(to: order.email, subject: "Order Successful") 	
  end

  def availablity_zero(user,product)
  	@user = user
  	@product = product
  	mail(to: user.email, Subject: "Your Product is empty please add it")
  end
end
