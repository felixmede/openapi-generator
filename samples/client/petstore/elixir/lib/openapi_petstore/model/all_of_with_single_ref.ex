# NOTE: This file is auto generated by OpenAPI Generator 7.0.1-SNAPSHOT (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule OpenapiPetstore.Model.AllOfWithSingleRef do
  @moduledoc """
  
  """

  @derive Jason.Encoder
  defstruct [
    :username,
    :SingleRefType
  ]

  @type t :: %__MODULE__{
    :username => String.t | nil,
    :SingleRefType => OpenapiPetstore.Model.SingleRefType.t | nil
  }

  alias OpenapiPetstore.Deserializer

  def decode(value) do
    value
     |> Deserializer.deserialize(:SingleRefType, :struct, OpenapiPetstore.Model.SingleRefType)
  end
end

