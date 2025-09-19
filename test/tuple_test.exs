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

  test "negating a tuple" do
    a = tuple(1, -2, 3, -4)
    assert negate(a) == tuple(-1, 2, -3, 4)
  end

  test "multiplying a tuple by a scalar" do
    a = tuple(1, -2, 3, -4)
    assert multiply(a, 3.5) == tuple(3.5, -7, 10.5, -14)
  end

  test "multiplying a tuple by a fraction" do
    a = tuple(1, -2, 3, -4)
    assert multiply(a, 0.5) == tuple(0.5, -1, 1.5, -2)
  end

  test "dividing a tuple by a scalar" do
    a = tuple(1, -2, 3, -4)
    assert divide(a, 2) == tuple(0.5, -1, 1.5, -2)
  end

  test "computing the magnitude of a vector" do
    v = vector(1, 0, 0)
    assert magnitude(v) == 1

    v = vector(0, 1, 0)
    assert magnitude(v) == 1

    v = vector(0, 0, 1)
    assert magnitude(v) == 1

    v = vector(1, 2, 3)
    assert magnitude(v) == :math.sqrt(14)

    v = vector(-1, -2, -3)
    assert magnitude(v) == :math.sqrt(14)
  end

  test "normalizing vector(4, 0, 0) produces (1, 0, 0)" do
    v = vector(4, 0, 0)
    assert normalize(v) == vector(1, 0, 0)
  end

  test "normalizing vector(1, 2, 3)" do
    v = vector(1, 2, 3)
    divisor = :math.sqrt(14)
    assert normalize(v) == vector((1/divisor), (2/divisor), (3/divisor))
  end

  test "the magnitude of a normalized vector is 1" do
    v = vector(1, 2, 3)
    normalized = normalize(v)
    assert magnitude(normalized) == 1
  end

  test "the dot product of two tuples" do
    a = vector(1, 2, 3)
    b = vector(2, 3, 4)
    assert dot(a, b) == 20
  end

  test "the cross product of two vectors" do
    a = vector(1, 2, 3)
    b = vector(2, 3, 4)
    assert cross(a, b) == vector(-1, 2, -1)
    assert cross(b, a) == vector(1, -2, 1)
  end
end
