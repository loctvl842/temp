-- sudo luarocks install lua-cjson
local cjson = require("cjson")

local open = io.open("./themes/monokai_pro.json", "r")
local json_str = open:read("*a")
local tbl = cjson.decode(json_str)
print(tbl.colors["editor.background"])
-- for i, v in pairs(tbl) do
--   print(i)
--   print(v)
-- end

open:close()
