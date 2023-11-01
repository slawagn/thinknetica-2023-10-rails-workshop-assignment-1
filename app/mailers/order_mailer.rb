class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def product_purchased_email(product_access, delivery)
    @product_access = product_access
    @delivery = delivery

    mail(to: 'foo@bar.xyz', subject: 'Product access email')
  end
end
