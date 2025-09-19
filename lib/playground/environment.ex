defmodule RayTracer.Playground.Environment do
  defstruct [:gravity, :wind]
  def environment(gravity, wind), do: %__MODULE__{gravity: gravity, wind: wind}
end
