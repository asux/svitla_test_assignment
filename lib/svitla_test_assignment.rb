module SvitlaTestAssignment

  def self.group_by_date(events)
    raise TypeError, "events not injectable" unless events.respond_to?(:inject)
    output = events.to_enum.inject({}) do |memo, original_item|
      raise TypeError, "event item not a hash-like object" unless original_item.respond_to?(:delete)
      item = original_item.dup
      date = item.delete(:date) || item.delete('date')
      raise ArgumentError, "event item must have :date" if date.nil?
      date = Date.parse(date) unless date.is_a?(Date)
      memo[date] = memo[date].nil? ? item : memo[date].merge(item)
      memo
    end.map do |key, value|
      {date: key}.merge(value)
    end
    output
  end
end
