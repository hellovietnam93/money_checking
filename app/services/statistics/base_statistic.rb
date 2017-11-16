module Statistics
  class BaseStatistic
    def initialize args
      @data = args[:data]
      @categories = args[:categories]
      @response_data = [{name: I18n.t("statistics.orther"), y: 0, extraValue: 0}]
      @total = 0
      @data.each do |d|
        @total += d.value if d.value.present?
      end
    end

    def execute
      calculate_data
      @response_data.reverse
    end

    private

    def calculate_data
      @categories.each do |category|
        sum = 0
        @data.select{|d| d.category_id == category.last}.each do |d|
          sum += d.value if d.value.present?
        end
        percent = 0
        percent = sum / @total * 100 if @total > 0

        if percent < 5.0
          @response_data.first[:y] += sum
          @response_data.first[:extraValue] += percent
        else
          @response_data << {name: category.first, y: sum,
            extraValue: ActionController::Base.helpers.number_to_percentage(percent)}
        end
      end
      @response_data.first[:extraValue] =
        ActionController::Base.helpers.number_to_percentage(@response_data.first[:extraValue])
    end
  end
end
