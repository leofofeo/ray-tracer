defmodule TupleTest do
  use ExUnit.Case
  alias Tuple
  doctest Tuple

  test "a tuple with w=1.0 is a point" do
    assert Tuple.is_point?(%Tuple{x: 4.3, y: -4.2, z: 3.1, w: 1.0})
  end

  test "a tuple with w=0.0 is a vector" do
    assert Tuple.is_vector?(%Tuple{x: 4.3, y: -4.2, z: 3.1, w: 0.0})
  end

  test "point() creates tuples with w=1.0" do
    assert Tuple.point(4, -4, 3) |> Tuple.is_point?()
  end

  test "vector() creates tuples with w=0.0" do
    assert Tuple.vector(4, -4, 3) |> Tuple.is_vector?()
  end
end
