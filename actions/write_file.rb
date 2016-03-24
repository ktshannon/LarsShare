class WriteFile < Dynflow::Action
  def plan opts
    puts "WriteFile#plan"
    plan_self opts
  end

  def run
    puts "WriteFile#run"
    File.open("data/#{input[:path]}", 'w') do |f|
      f << input[:data]
    end
  end
end
