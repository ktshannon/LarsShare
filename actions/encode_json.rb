class EncodeJson < Dynflow::Action
  def run
    puts "EncodeJson#run"
    output[:data] = JSON.dump input[:data]
  end
end
