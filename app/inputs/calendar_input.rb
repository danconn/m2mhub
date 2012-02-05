class CalendarInput < Formtastic::Inputs::StringInput
  # def input_html_options
  #   super.merge(:class => 'calendar')
  # end

  def input_html_options
    {
      :maxlength => options[:input_html].try(:[], :maxlength) || limit,
      :size => builder.default_text_field_size,
      :placeholder => placeholder_text,
      :value => value,
      :class => 'calendar'
    }.merge(super)
  end

  def value
    v = object.send(method) if object && object.respond_to?(method)
    (v || Date.current).to_s(:calendar_date)
  end
  
  # def calendar_input(method, options)
  #   # don't want to use #{method}_before_type_cast; want to get the value after it has been formatted
  #   options[:value] ||= @object.send(method).try(:to_s, :mdy)
  #   label(method, options.delete(:label), options.slice(:required)) + text_field(method, options.except(:required))
  # end
  # 
end