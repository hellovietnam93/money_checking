module Statistics
  class MonthlyBalance
    def initialize args
      @user = args[:user]
      @months = @user.months.last Settings.lastest_months
      @monthly_blance = Array.new
      @categories = Array.new
      @incomes = Array.new
      @outcomes = Array.new
      @balances = Array.new
    end

    def execute
      calculate_data
      @monthly_blance =
        [
          {
            name: I18n.t("statistics.line.titles.incomes"),
            data: @incomes
          },
          {
            name: I18n.t("statistics.line.titles.outcomes"),
            data: @outcomes
          },
          {
            name: I18n.t("statistics.line.titles.balances"),
            data: @balances
          }
        ]
      {categories: @categories, monthly_blance: @monthly_blance}
    end

    private

    def calculate_data
      @months.each do |month|
        @categories << I18n.l(month.value, format: :month)
        income_total = @user.incomes.where(month_id: month.id).sum :value
        outcome_total = @user.outcomes.where(month_id: month.id).sum :value
        balances = income_total - outcome_total
        @incomes << income_total
        @outcomes << outcome_total
        @balances << balances
      end
    end
  end
end
