if Rails.env.production?
  $redis = Redis.new(host: ENV["redis://h:pc86af68b45349202d83948420bfb1fb0040ad4b6f596be611082188cc3d1ee49@ec2-52-5-188-199.compute-1.amazonaws.com:28579"])
else
  $redis = Redis.new(host: 'localhost', port: 6379)
end
