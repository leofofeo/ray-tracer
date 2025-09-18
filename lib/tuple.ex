defmodule Tuple do
  defstruct [:x, :y, :z, :w]

  @type t :: %__MODULE__{
    x: float(),
    y: float(),
    z: float(),
    w: float(),
  }

  def point(x, y, z), do: %__MODULE__{x: x, y: y, z: z, w: 1.0}
  def vector(x, y, z), do: %__MODULE__{x: x, y: y, z: z, w: 0.0}
  def is_point?(%__MODULE__{w: w}), do: w == 1
  def is_vector?(%__MODULE__{w: w}), do: w == 0

end
