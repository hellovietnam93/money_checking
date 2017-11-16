module Statistics
  class BaseStatistic
    def initialize args
      @data = args[:data]
      @categories = args[:categories]
      @response_data = Array.new
      @total = 0
      @data.each do |d|
        @total += d.value if d.value.present?
      end
    end

    def execute
      calculate_data
      @response_data
    end

    private

    def calculate_data
      @categories.each do |category|
        sum = 0
        @data.select{|d| d.category_id == category.last}.each do |d|
          sum += d.value if d.value.present?
        end

        @response_data << {name: category.first, y: sum,
          extraValue: ActionController::Base.helpers.number_to_percentage(sum / @total * 100)}
      end
    end
  end
end
