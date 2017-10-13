defmodule StringCalculatorKataInElixir.Application do
  def parse(command) do
    command |> String.split |> recognize
  end

  def recognize([username]) do
    "READ(#{username})"
  end

  def recognize([username, "->" | message]) do
    "POST(#{username}, #{Enum.join(message, " ")})"
  end

  def recognize([username, "follows", another_username]) do
    "FOLLOW(#{username}, #{another_username})"
  end

  def recognize([username, "wall"]) do
    "WALL(#{username})"
  end

  def recognize([]) do
    "Command not recognized"
  end

  def recognize([username | _]) do
    "Command not recognized"
  end
end
