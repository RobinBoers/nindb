defmodule NinDB.Encrypted.Binary do
  use Cloak.Ecto.Binary, vault: NinDB.Vault
end
