defmodule EssenceLink.Repo do
  use Ecto.Repo,
    otp_app: :essence_link,
    adapter: Ecto.Adapters.Postgres
end
