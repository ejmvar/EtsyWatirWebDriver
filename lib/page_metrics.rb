require 'yaml'

class PageMetrics
  def initialize
    @pages = {}
  end

  def add_page class_name, performance
    @pages[class_name] ||= []
    @pages[class_name] << performance
  end

  def summary
    summary = []
    @pages.each do |page, metrics|
      average = metrics.inject(0) { |sum, metric| sum + metric.summary[:response_time] }/metrics.size/1000
      result = {
        :page => page.to_s,
        :visits => metrics.size,
        :average_time => average
      }
      summary << result
    end
    summary.to_yaml
  end
end