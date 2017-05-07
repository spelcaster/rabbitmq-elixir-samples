# Download dependencies

```shell
mix deps.get
```

# Build dependencies

```shell
mix deps.compile
```

# Run the producer service

## Send one message

```
mix run new_task.exs Is this a message\?.
```

* The message must end with 1 or more `*`


## Send 10 messages

```shell
mix run auto_task.exs

```

# Run the consumer

```shell
mix run worker.exs
```
