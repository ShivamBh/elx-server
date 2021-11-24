defmodule Servy.Conv do
  defstruct [
    method: "", 
    path: "", 
    resp_body: "", 
    status: nil,
    params: %{},
    headers: %{}
    
  ]

  def full_status(conv) do
    "#{conv.status} #{status_reason(conv.status)}"
  end

  @doc """
  private func, can only be called within defining module
  key of map is not an atom, but a number
  hence the => syntax is used
  """
  defp status_reason(code) do
    %{
      200 => "OK",
      201 => "Created",
      401 => "Unauthorized",
      403 => "Forbidden",
      404 => "Not Found",
      500 => "Internal Server Error"
    }[code]
  end

end