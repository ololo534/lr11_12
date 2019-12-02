require 'test_helper'

class AnswerTest < ActiveSupport::TestCase

  test 'Palindrom input' do
    assert_equal [["3", "11"], ["1", "1"]], Answer.where(query: 4).first_or_create.get_solution
  end

  test 'Different results' do
    assert_not_equal Answer.where(query: 5).first_or_create.get_solution,
                     Answer.where(query: 11).first_or_create.get_solution
  end

  test 'Input number smaller than 0' do
    assert_equal [], Answer.where(query: -1).first_or_create.get_solution
  end

  test 'Double data' do
    (Answer.find_by query: 9).destroy unless (Answer.find_by query: 9).nil?
    Answer.create query: 9, solution: ActiveSupport::JSON.encode([9, true])
    Answer.create query: 9, solution: ActiveSupport::JSON.encode([9, true])
    (Answer.find_by query: 9).destroy
    assert_nil Answer.find_by query: 9
  end

  test 'Adding in base' do
    (Answer.find_by query: 9).destroy unless (Answer.find_by query: 9).nil?
    Answer.create query: 9, solution: ActiveSupport::JSON.encode([9, true])
    assert_not_nil Answer.find_by query: 9
  end
end
