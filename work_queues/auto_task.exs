defmodule AutoTask do
  def send_message(_, _, pos) when pos == 0 do
  end

  def send_message(channel, text, pos) do
    IO.puts(" - Creating message #{Integer.to_string(pos)}")

    message = Enum.join([text, Integer.to_string(pos)], " ")
    message = Enum.join([message, String.duplicate(".", pos)], "")

    AMQP.Basic.publish(channel, "", "task_queue", message, persistent: true)

    IO.puts(" [x] Sent '#{message}'")

    send_message(channel, text, pos-1)
  end
end

{:ok, connection} = AMQP.Connection.open
{:ok, channel} = AMQP.Channel.open(connection)

AMQP.Queue.declare(channel, "task_queue")

text = "Aw, man"
AutoTask.send_message(channel, text, 10)

AMQP.Connection.close(connection)
