# NOTE: This file is auto generated by OpenAPI Generator 7.0.1-SNAPSHOT (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule OpenapiPetstore.Model.FakeBigDecimalMap200Response do
  @moduledoc """
  
  """

  @derive Jason.Encoder
  defstruct [
    :someId,
    :someMap
  ]

  @type t :: %__MODULE__{
    :someId => float() | nil,
    :someMap => %{optional(String.t) => float()} | nil
  }

  def decode(value) do
    value
  end
end

