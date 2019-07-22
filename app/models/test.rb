class Test < ApplicationRecord
  def self.sort_desc_test_name_by_category(title)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where(categories: {title: title}).order(title: :desc).pluck(:title)
  end
end

# Создайте метод класса в модели Test,
# который возвращает отсортированный по убыванию
# массив названий всех Тестов у которых Категория
# называется определённым образом
# (название категории передается в метод в качестве аргумента).
