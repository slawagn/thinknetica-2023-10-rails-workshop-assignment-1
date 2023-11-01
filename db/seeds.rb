10.times { |i| Product.create!(id: i + 1, cost: rand(1..1000)) }

10.times { |i| User.create!(cloud_payments_uid: i + 1) }
