defmodule StringCalculatorKataInElixir do
  def main(_args) do
    next_command() |> process
  end

  def next_command() do
    IO.gets "\> "
  end

  def process("exit\n") do
  end

  def process(command) do
    command |> StringCalculatorKataInElixir.Application.parse |> IO.puts
    next_command() |> process
  end

  def parse(command) do
    IO.puts command
  end
end
