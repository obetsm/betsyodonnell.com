module Jekyll
  module WhereMatchesFilter
    def where_matches(input, property, value)
      input = input.values if input.is_a?(Hash)
      result = input.select do |object|
        items = item_property(object, property)
        items && items.any? { |item| item.match(value) }
      end

      return result
    end
  end
end

Liquid::Template.register_filter(Jekyll::WhereMatchesFilter)
