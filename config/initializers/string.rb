class String
  def snake_case
    gsub(/\s+/,"_").underscore
  end
end
