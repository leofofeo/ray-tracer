defmodule TupleTest do
  use ExUnit.Case
  import Tuple
  doctest Tuple

  test "a tuple with w=1.0 is a point" do
    assert is_point?(%Tuple{x: 4.3, y: -4.2, z: 3.1, w: 1.0})
  end

  test "a tuple with w=0.0 is a vector" do
    assert is_vector?(%Tuple{x: 4.3, y: -4.2, z: 3.1, w: 0.0})
  end

  test "point() creates tuples with w=1.0" do
    assert point(4, -4, 3) |> Tuple.is_point?()
  end

  test "vector() creates tuples with w=0.0" do
    assert vector(4, -4, 3) |> Tuple.is_vector?()
  end

  test "floating points are equal" do
    assert equal?(1.0000001, 1.0000002)
  end

  test "floating points are not equal" do
    refute equal?(1.0001, 1.0002)
  end

  test "add two tuples" do
    a1 = tuple(3, -2, 5, 1)
    a2 = tuple(-2, 3, 1, 0)
    assert add(a1, a2) == tuple(1, 1, 6, 1)
  end

  test "subtract two points" do
    p1 = point(3, 2, 1)
    p2 = point(5, 6, 7)
    assert subtract(p1, p2) == vector(-2, -4, -6)
  end

  test "subtract a vector from a point" do
    p = point(3, 2, 1)
    v = vector(5, 6, 7)
    assert subtract(p, v) == point(-2, -4, -6)
  end

  test "subtract two vectors" do
    v1 = vector(3, 2, 1)
    v2 = vector(5, 6, 7)
    assert subtract(v1, v2) == vector(-2, -4, -6)
  end
end
