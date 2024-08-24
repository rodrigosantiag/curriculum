defmodule ThreePagesWeb.ProjectsController do
  use ThreePagesWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
