{:ok, connection} = AMQP.Connection.open
{:ok, channel} = AMQP.Channel.open(connection)

# ensure queue existence
AMQP.Queue.declare(channel, "hello")

AMQP.Basic.publish(channel, "", "hello", "Hello World")

IO.puts(" [x] Sent 'Hello World!'")

AMQP.Connection.close(connection)
