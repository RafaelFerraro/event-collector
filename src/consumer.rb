class Consumer
  include Phobos::Handler

  def around_consume(payload, metadata)
    puts '--------------- A new message arrived! --------------------'
    yield(payload, metadata)
    puts '-------------- Message consumed... ------------------------'
  end

  def consume(payload, _metadata)
    puts "Message: #{payload}"
  end
end
