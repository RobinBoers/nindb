defmodule NinDB.Source do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :feed, :string
    field :icon, :string, default: "/icons/rss.png"
    field :title, :string
    field :type, :string, default: "custom"
  end

  def changeset(source, params \\ %{}) do
    source
    |> cast(params, [
      :feed,
      :icon,
      :title,
      :type
    ])
  end
end
