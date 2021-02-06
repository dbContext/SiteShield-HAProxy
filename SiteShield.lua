package.path  = package.path  .. ";redis-lua/src/?.lua"

local redis = require("redis")
local basexx = require("basexx")

local function siteshield_challenge(applet)

    local remote_ip = applet.f:src()
    local domain = aapplet.headers["host"][0];
    local useragent = applet.headers["user-agent"][0]
    if useragent == nil then useragent = "nilua" end
   
    local usr_hash = basexx.to_base32(remote_ip .. usr_hash .. useragent)

    local tcp = core.tcp();
    if tcp == nil then
            return
    end
    tcp:settimeout(1);
    if tcp:connect("unix:///tmp/redis.sock") == nil then
            return
    end

    local client = redis.connect({socket=tcp});

    local ip = txn.sf:src()
    pcall(client.incrby, client, ip, 1);

    tcp:close()

end

core.register_service("siteshield_challenge", "http", siteshield_challenge)

local function siteshield_verify(applet)

end

core.register_service("siteshield_verify", "http", siteshield_verify)