defmodule EbbsNeies.Repo do
  use Ecto.Repo,
    otp_app: :ebbs_neies,
    adapter: Ecto.Adapters.Postgres
end
