class GetEntries < Dynflow::Action
  include Dynflow::Action::WithSubPlans

  def plan ids
    puts "GetEntries#plan"
    limit_concurrency_level 5
    super(ids: ids)
  end

  def create_sub_plans
    puts "GetEntries#create_sub_plans"
    input[:ids][0..10].map do |id|
      trigger(GetEntry, id)
    end
  end

  def finalize
    puts "GetEntries#finalize"
    output[:entries] = [1,2,3]
  end
end
