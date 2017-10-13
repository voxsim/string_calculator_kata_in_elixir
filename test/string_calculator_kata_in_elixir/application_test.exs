defmodule StringCalculatorKataInElixir.ApplicationTest do
  use ExUnit.Case
  doctest Application

  test "read command" do
    assert StringCalculatorKataInElixir.Application.parse("Alice") === "READ(Alice)"
  end

  test "read command with spaces at the beginning" do
    assert StringCalculatorKataInElixir.Application.parse(" Alice") === "READ(Alice)"
  end

  test "read command with spaces at the end" do
    assert StringCalculatorKataInElixir.Application.parse("Alice ") === "READ(Alice)"
  end

  test "post command" do
    assert StringCalculatorKataInElixir.Application.parse("Alice -> I love the weather today") === "POST(Alice, I love the weather today)"
  end

  test "post command with spaces at the beginning" do
    assert StringCalculatorKataInElixir.Application.parse(" Alice -> I love the weather today") === "POST(Alice, I love the weather today)"
  end

  test "post command with spaces at the end" do
    assert StringCalculatorKataInElixir.Application.parse("Alice -> I love the weather today ") === "POST(Alice, I love the weather today)"
  end

  test "follows command" do
    assert StringCalculatorKataInElixir.Application.parse("Alice follows Bob") === "FOLLOW(Alice, Bob)"
  end

  test "follows command with spaces at the beginning" do
    assert StringCalculatorKataInElixir.Application.parse(" Alice follows Bob") === "FOLLOW(Alice, Bob)"
  end

  test "follows command with spaces at the end" do
    assert StringCalculatorKataInElixir.Application.parse("Alice follows Bob ") === "FOLLOW(Alice, Bob)"
  end

  test "follows command with unknown parameter" do
    assert StringCalculatorKataInElixir.Application.parse("Alice follows Bob unknown") === "Command not recognized"
  end

  test "wall command" do
    assert StringCalculatorKataInElixir.Application.parse("Alice wall") === "WALL(Alice)"
  end

  test "wall command with spaces at the beginning" do
    assert StringCalculatorKataInElixir.Application.parse(" Alice wall") === "WALL(Alice)"
  end

  test "wall command with spaces at the end" do
    assert StringCalculatorKataInElixir.Application.parse("Alice  wall") === "WALL(Alice)"
  end

  test "wall command with spaces between username and command" do
    assert StringCalculatorKataInElixir.Application.parse("Alice wall ") === "WALL(Alice)"
  end

  test "wall command with unknown parameter" do
    assert StringCalculatorKataInElixir.Application.parse("Alice wall unknown") === "Command not recognized"
  end

  test "empty command is unknown" do
    assert StringCalculatorKataInElixir.Application.parse("") === "Command not recognized"
  end

  test "one space command is unknown" do
    assert StringCalculatorKataInElixir.Application.parse(" ") === "Command not recognized"
  end

  test "multiple spaces command is unknown" do
    assert StringCalculatorKataInElixir.Application.parse("    ") === "Command not recognized"
  end

  test "unknown command" do
    assert StringCalculatorKataInElixir.Application.parse("Alice unknown") === "Command not recognized"
  end
end
