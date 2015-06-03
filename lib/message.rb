class Message
  def initialize(body, user, url)
    @body = body
    @user = user
    @url = url
  end

  def send
    HTTParty.post "http://localhost:3010/messages", body: {
      message: {
        body: @body,
        user: @user
        url: @url
      }
    }.to_json, headers: {
      "Accept" => 'application/json'
      "Content-Type" => 'application/json'
    }
  end
end
