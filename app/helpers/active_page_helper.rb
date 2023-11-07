module ActivePageHelper
  def set_active_class?(url_path)
    current_page?(url_path) ? 'active' : ''
  end
end
