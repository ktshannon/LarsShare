class CreateFeed < Dynflow::Action
  def plan
    puts "CreateFeed#plan"
    sequence do
      ids = plan_action(GetFeedIds).output[:ids]
      plan_action(GetEntries, ids)
      entries = plan_action(ReadEntries).output[:entries]
      plan_action(WriteCSV, entries: entries)
    end
  end
end
