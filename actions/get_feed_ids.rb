class GetFeedIds < Dynflow::Action
  def run
    puts "GetFeedIds#run"
    res = RestClient.get "https://www.teepublic.com/api/channel-advisor-designs", Authorization: "Token token=#{ENV['TOKEN']}"
    json = JSON.parse res.body
    output[:ids] = json['ids']
  end
end
