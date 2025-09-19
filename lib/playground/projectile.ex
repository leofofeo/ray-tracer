defmodule RayTracer.Playground.Projectile do
  defstruct [:position, :velocity]
  def projectile(position, velocity), do: %__MODULE__{position: position, velocity: velocity}
end
