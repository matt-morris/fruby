class String
  def snake_case
    self.gsub(/::/, '/')
        .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
        .gsub(/([a-z\d])([A-Z])/, '\1_\2')
        .tr("-", "_")
        .downcase
  end

  def pascal_case
    snake_case.split('_').map(&:capitalize).join.split('/').map(&:capitalize).join('::')
  end

  def camel_case
    snake_case.split('_').map.with_index { |word, i| i == 0 ? word : word.capitalize }.join
              .split('/').map.with_index { |word, i| i == 0 ? word : word.capitalize }.join('::')
  end

  def kebab_case
    self.gsub(/::/, '/')
        .gsub(/([A-Z]+)([A-Z][a-z])/, '\1-\2')
        .gsub(/([a-z\d])([A-Z])/, '\1-\2')
        .tr("_", "-")
        .downcase
  end
end
