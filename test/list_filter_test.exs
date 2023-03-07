defmodule ListFilterTest do
  use ExUnit.Case
  doctest ListFilter

  describe "call/1" do
    test "returns the count of odds numerics string in a list" do
      list = ["1", "3", "6", "43", "test", "6", "odd"]

      assert 3 == ListFilter.call(list)
    end

    test "returns 0 when no odds are found" do
      list = ["2", "4", "even", "6", "test"]

      assert 0 == ListFilter.call(list)
    end

    test "returns error when list has other item besides strings" do
      list = ["1", 2, :odd]

      assert :invalid_list == ListFilter.call(list)
    end

    test "returns error when receive an invalid argument" do
      invalid = "not a list"

      assert :invalid_argument == ListFilter.call(invalid)
    end
  end
end
