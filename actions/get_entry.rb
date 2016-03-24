class GetEntry < Dynflow::Action
  def plan id
    puts "GetEntry#plan"
    path = "entries/#{id}.json"
    unless File.exist? path
      sequence do
        data = plan_self(id: id).output[:data]
        json = plan_action(EncodeJson, data: data).output[:data]
        plan_action WriteFile, path: path, data: json
      end
    end
  end

  def run
    puts "GetEntry#run"
    res = RestClient.get "https://www.teepublic.com/api/channel-advisor-designs/#{input[:id]}", Authorization: "Token token=#{ENV['TOKEN']}"
    json = JSON.parse res.body
    output[:data] = json['result'].values
    # output[:data] = '{"foo":42}'
  end
end
