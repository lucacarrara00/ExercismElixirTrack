defmodule Newsletter do
  def read_emails(path),
    do:
      path
      |> File.read()
      |> then(fn {_, binary} ->
        binary |> String.split("\n", trim: true)
      end)

  def open_log(path),
    do:
      path
      |> File.open!([:write])

  def log_sent_email(pid, email), do: pid |> IO.puts(email)

  def close_log(pid), do: pid |> File.close()

  def send_newsletter(emails_path, log_path, send_fun) do
    pid = log_path |> open_log()

    emails_path
    |> read_emails()
    |> Enum.each(fn email ->
      if email |> send_fun.() == :ok do
        pid |> log_sent_email(email)
      end
    end)
    |> then(fn _ ->
      pid |> close_log()
    end)
  end
end
