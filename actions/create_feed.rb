class CreateFeed < Dynflow::Action
  def plan
    puts "CreateFeed#plan"
    sequence do
      ids = plan_action(GetFeedIds).output[:ids]
      plan_action(GetEntries, ids)
      plan_action(ProcessCSV)
    end
  end
end
