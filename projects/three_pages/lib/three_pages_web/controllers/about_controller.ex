defmodule ThreePagesWeb.AboutController do
  use ThreePagesWeb, :controller

  def about(conn, _params) do
    render(conn, :about)
  end
end
