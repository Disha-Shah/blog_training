class ResponseTime
  def initialize app
    @app = app
  end

  def call(env)
    start_time = Time.now
    data = @app.call(env)
    end_time = Time.now
    Rails.logger.info(" --- Response time #{end_time - start_time}")
    data
  end
end