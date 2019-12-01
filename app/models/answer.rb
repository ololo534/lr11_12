class Answer < ApplicationRecord
  validates :query, presence: true, uniqueness: true
  before_create :calculate

  def get_solution
    ActiveSupport::JSON.decode(solution)
  end

  private

  def palindrome?(item)
    item == item.reverse
  end

  def calculate
    a = query.to_i
    result = if !a || a.empty?
                'Enter number!'
              else
                res = []
                while a.positive?
                  if palindrome?(a.to_s) && palindrome?(a.to_s(2))
                    res.push [a.to_s, a.to_s(2)]
                  end
                  n -= 1
                end
                res
              end
    self.solution = ActiveSupport::JSON.encode(result)
  end
end