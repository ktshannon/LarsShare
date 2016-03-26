class GetEntries < Dynflow::Action
  include Dynflow::Action::WithSubPlans

  def plan ids
    puts "GetEntries#plan"
    limit_concurrency_level REQUEST_CONCURRENCY
    super(ids: ids)
  end

  def create_sub_plans
    puts "GetEntries#create_sub_plans"
    captured = Dir['data/entries/*.json'].map { |f| $1.to_i if f =~ /(\d+)\.json$/ }
    (input[:ids].reverse - captured)[0...REQUEST_LIMIT].map do |id|
      trigger(GetEntry, id)
    end
  end

  def finalize
    puts "GetEntries#finalize"
  end
end
