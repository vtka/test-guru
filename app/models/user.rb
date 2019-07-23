class User < ApplicationRecord
  def show_passed_tests_by_level(level)
    Test.joins("INNER JOIN results ON tests.id = results.test_id").where(results: {user_id: self.id}, tests: {level: level})
  end
end

# Создайте инстанс-метод в модели User, который принимает в
# качестве аргумента значение уровня сложности и возвращает
# список всех Тестов, которые проходит или когда-либо проходил
# Пользователь на этом уровне сложности
