module ApplicationHelper
  def full_title(title = nil)
    if title
      "#{title} | #{app_name}"
    else
      app_name
    end
  end

  def bootstrap_flash(key)
    {"notice" => "success", "error" => "danger", "alert" => "warning"}.fetch(key)
  end

  def app_name
    "My App"
  end

  def company_name
    "Stephen Mariano Cabrera"
  end
end
