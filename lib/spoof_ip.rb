class SpoofIp
  def initialize(app)
    @app = app
  end

  def call(env)
    env['REMOTE_ADDR'] = env['action_dispatch.remote_ip'] = ENV['IP']
    @status, @headers, @response = @app.call(env)
    [@status, @headers, @response]
  end
end
