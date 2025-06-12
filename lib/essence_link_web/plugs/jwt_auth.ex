defmodule EssenceLinkWeb.Plugs.JWTAuth do
  import Plug.Conn
  alias EssenceLinkWeb.Auth

  def init(opts), do: opts

  def call(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, claims} <- Auth.verify_token(token) do
      assign(conn, :current_user, claims)
    else
      _ ->
        conn
        |> send_resp(401, "Unauthorized")
        |> halt()
    end
  end
end
