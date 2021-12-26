defmodule NinDB.Source do
  use Ecto.Schema

  embedded_schema do
    field :feed, :string
    field :icon, :string, default: "/icons/rss.png"
    field :title, :string
    field :type, :string, default: "custom"
  end
end
