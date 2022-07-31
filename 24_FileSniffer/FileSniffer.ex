defmodule FileSniffer do
  def type_from_extension(extension) do
    extension |> from_extension_to_media_type()
  end

  def type_from_binary(<<0x7F, 0x45, 0x4C, 0x46, _::binary>>), do: "application/octet-stream"
  def type_from_binary(<<0x42, 0x4D, _::binary>>), do: "image/bmp"

  def type_from_binary(<<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary>>),
    do: "image/png"

  def type_from_binary(<<0xFF, 0xD8, 0xFF, _::binary>>), do: "image/jpg"
  def type_from_binary(<<0x47, 0x49, 0x46, _::binary>>), do: "image/gif"

  def verify(file_binary, extension) do
    type = extension |> type_from_extension()

    case binary_extension_correct?(file_binary |> type_from_binary(), type) do
      true -> {:ok, type}
      false -> {:error, "Warning, file format and file extension do not match."}
    end
  end

  defp from_extension_to_media_type("exe"), do: "application/octet-stream"
  defp from_extension_to_media_type(ext), do: "image/#{ext}"

  defp binary_extension_correct?(type_from_binary, type),
    do: type_from_binary == type
end
