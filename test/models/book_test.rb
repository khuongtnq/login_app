require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @book = Book.new(name: "the advanture", author: "khuong")
  end

  test "should be valid" do
    assert @book.valid?
  end

  test "name should be present" do
    @book.name = "     "
    assert_not @book.valid?
  end
end
