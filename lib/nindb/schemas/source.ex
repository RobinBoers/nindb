defmodule NinDB.Source do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    # only here because Phoenix requires it in params
    field(:id, :integer, default: nil)
    field(:feed, :string)
    field(:icon, :string, default: "/icons/rss.png")
    field(:title, :string)
    field(:type, :string, default: "custom")
  end

  def changeset(source, params) do
    source
    |> cast(params, [
      :feed,
      :icon,
      :title,
      :type
    ])
  end
end
