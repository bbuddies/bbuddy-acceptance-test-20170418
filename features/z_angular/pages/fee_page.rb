class FeePage < PageBase

  def await
    wait_for_element_exists('charge')
    self
  end

end