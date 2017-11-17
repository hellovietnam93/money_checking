namespace :db do
  desc "create function"
  task update_month: :environment do
    Income.all.each do |income|
      income.update month: Month.find(income.month_id).value
    end

    Outcome.all.each do |outcome|
      outcome.update month: Month.find(outcome.month_id).value
    end
  end
end
