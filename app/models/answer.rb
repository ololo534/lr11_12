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
    res = []
    while a.positive?
      if palindrome?(a.to_s) && palindrome?(a.to_s(2))
        res.push [a.to_s, a.to_s(2)]
      end
      a -= 1
    end
    result = res
    self.solution = ActiveSupport::JSON.encode(result)
  end
end