class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def product_access_email(product_access)
    @product_access = product_access

    mail(to: 'foo@bar.xyz', subject: 'Product access email')
  end
end
