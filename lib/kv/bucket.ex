defmodule KV.Bucket do
  @doc """
  Starts a new Bucket
  """
 def start_link do
   Agent.start_link(fn -> %{} end)
 end

 @doc """
 Gets a value from the bucket key.
 """
 def get(bucket, key) do
   Agent.get(bucket, &(&1[key]))
 end

 @doc """
 Sets a value for a key
 """
 def put(bucket, key, value) do
   Agent.update(bucket, &Map.put(&1, key, value))
 end

 @doc """
 Deletes a value from bucket
 """
 def delete(bucket, key) do
   Agent.get_and_update(bucket, &Map.pop(&1, key))
 end
end
