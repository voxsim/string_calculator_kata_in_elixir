defmodule StringCalculatorKataInElixir.Command do
  def post(user, message) do
    user = get_or_create(user)
    %StringCalculatorKataInElixir.User{user | messages: [message] ++ user.messages}
  end

  defp get_or_create(user) do
    case user do
      nil -> %StringCalculatorKataInElixir.User{}
      _ -> user
    end
  end
end
