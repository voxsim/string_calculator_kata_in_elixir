defmodule StringCalculatorKataInElixir.Application do
  def parse(command, users \\ %{}) do
    command |> String.split |> recognize(users)
  end

  def recognize([username], _) do
    "READ(#{username})"
  end

  def recognize([username, "->" | message], users) do
    Map.put(users, username, StringCalculatorKataInElixir.Command.post(users[username], Enum.join(message, " ")))
  end

  def recognize([username, "follows", another_username], _) do
    "FOLLOW(#{username}, #{another_username})"
  end

  def recognize([username, "wall"], _) do
    "WALL(#{username})"
  end

  def recognize([], _) do
    "Command not recognized"
  end

  def recognize([_ | _], _) do
    "Command not recognized"
  end
end
