module ApplicationHelper
  def full_title page_title = ""
    base_title = t "app.name"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  def flash_class level
    flash_level = level
    case flash_level
    when :notice then "alert-info"
    when :error then "alert-error"
    when :warning then "alert-warning"
    when :success then "alert-success"
    end
  end

  def flash_message flash_type, *params
    if params.empty?
      t "flashes.messages.#{flash_type}",
        model_name: controller_name.classify.constantize.model_name.human
    else
      param = params[0]
      t "flashes.messages.#{flash_type}", models_name: param.join(", ")
    end
  end

  def i18n_enum model_name, enum
    enum = enum.to_s.pluralize
    model_name = model_name.to_s
    model_name.classify.constantize.public_send(enum).keys.map do |key|
      OpenStruct.new key: key,
                     value: t("#{model_name.pluralize}.#{enum}.#{key}")
    end.flatten
  end

  def avatar
    image_tag "default-user-img.png",
      class: "img-circle profile-user-img img-responsive img-circle"
  end
end
