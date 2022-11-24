local function get_server(server_name)
  local status_ok, server = pcall(require, "test.servers." .. server_name)
  if not status_ok then
    print("There is no specific settings for server " .. server_name)
    return
  end
  print(server.text)
end

get_server("server1")
