defmodule RayTracer.Playground do
  alias RayTracer.Tuple
  alias RayTracer.Playground.Projectile
  def tick(env, proj) do
    position = Tuple.add(proj.position, proj.velocity)
    velocity = Tuple.add(proj.velocity, env.gravity) |> Tuple.add(env.wind)
    %Projectile{position: position, velocity: velocity}
  end
end
