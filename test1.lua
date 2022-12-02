local M = {}

function M.foo()
  print('loc')
end

function M.call()
  M.foo()
end

M.call()
