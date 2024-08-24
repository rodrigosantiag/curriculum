defmodule RandomNumberWeb.RandomNumberController do
  use RandomNumberWeb, :controller

  def index(conn, _params) do
    random_number = Enum.random(1..100)
    render(conn, :index, random_number: random_number)
  end
end
