class ReadEntries < Dynflow::Action
  def run
    output[:entries] = Dir['data/entries/*'].inject([]) do |list, f|
      content = File.read(f)
      list + JSON.parse(content)
    end
  end
end
