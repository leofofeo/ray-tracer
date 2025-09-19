defmodule Tuple do
  defstruct [:x, :y, :z, :w]
  @epsilon 0.00001

  @type t :: %__MODULE__{
    x: float(),
    y: float(),
    z: float(),
    w: float(),
  }

  def equal?(a, b), do: abs(a - b) < @epsilon
  def tuple(x, y, z, w), do: %__MODULE__{x: x, y: y, z: z, w: w}
  def point(x, y, z), do: tuple(x, y, z, w=1.0)
  def vector(x, y, z), do: tuple(x, y, z, w=0.0)
  def is_point?(%__MODULE__{w: w}), do: w == 1
  def is_vector?(%__MODULE__{w: w}), do: w == 0

  def add(a, b), do: tuple(a.x + b.x, a.y + b.y, a.z + b.z, a.w + b.w)
  def subtract(a, b), do: tuple(a.x - b.x, a.y - b.y, a.z - b.z, a.w - b.w)
  def negate(a), do: tuple(-a.x, -a.y, -a.z, -a.w)
  def multiply(a, b), do: tuple(a.x * b, a.y * b, a.z * b, a.w * b)
  def divide(a, b), do: tuple(a.x / b, a.y / b, a.z / b, a.w / b)

  def magnitude(a), do: :math.sqrt(a.x * a.x + a.y * a.y + a.z * a.z + a.w * a.w)
  def normalize(v) do
    v_mag = magnitude(v)
    tuple(v.x / v_mag, v.y / v_mag, v.z / v_mag, v.w / v_mag)
  end

  def dot(a, b), do: a.x * b.x + a.y * b.y + a.z * b.z + a.w * b.w
  def cross(a, b) do
    vector(
      a.y * b.z - a.z * b.y,
      a.z * b.x - a.x * b.z,
      a.x * b.y - a.y * b.x
    )
  end
end
