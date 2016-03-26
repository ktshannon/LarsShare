class ProcessCSV < Dynflow::Action
  def run
    puts "ProcessCSV#run"
    write_header = true
    CSV.open "data/final.csv", "wb" do |csv|
      Dir['data/entries/*'].each do |f|
        JSON.parse(File.read(f)).each do |data|
          if write_header
            csv << data.keys
            write_header = false
          end
          csv << data.values
        end
      end
    end
  end
end
