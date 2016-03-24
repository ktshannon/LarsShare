class WriteCSV < Dynflow::Action
  # def plan opts
  #   plan_self opts
  # end

  def run
    puts "WriteCSV#run"
    entries = input[:entries]
    CSV.open "data/final.csv", "wb" do |csv|
      csv << entries.first.keys
      entries.each do |e|
        csv << e.values
      end
    end
  end
end
