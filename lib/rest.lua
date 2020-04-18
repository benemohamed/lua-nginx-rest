--
-- Start
-- @see https://github.com/openresty/lua-nginx-module
-- @see http://www.londonlua.org/scripting_nginx_with_lua/slides.html
-- @see https://devdocs.io/nginx_lua_module/index#http-method-constants

rest = {}
rest.__index = rest

local HTTPS = false

local ALLOWER_HEADERS = {}

local ALLOWER_METHODS = {}

local SUPPORTED_FORMAT = {}

local REQUEST = nil

local RESPONSE = nil

function rest:create()
    local Rest = {} -- our new object
    setmetatable(Rest, self) --  handle lookup

    -- self.__index = self

    -- Rest.remote_addr = ngx.var.remote_addr
    -- Rest.method = ngx.req.get_method
    -- Rest.path = ngx.var.request_uri
    -- Rest.query = nil
    -- Rest.body = nil
    -- Rest.cookies = nil
    -- Rest.hostname = nil
    -- Rest.protocol = nil
end

function rest:request()
    -- body
end

function rest:response()
    -- body
end

function rest:set_response(data, status_constants)
    ngx.status = ngx.HTTP_OK -- 405
    ngx.say(data)
    ngx.exit(ngx.HTTP_OK)
end

function rest:set_status_header()
    ngx.req.set_header("Content-Type", "text/css")
end

function rest:query()
    -- body
end

function rest:get(path)
    -- if ngx.req.get_method() == "GET" then
    -- ngx.req.set_method("GET")
    ngx.req.set_uri(path)
    ngx.say(ngx.req.raw_header(true))
    -- end
    --
end

function rest:head(path)
    ngx.req.set_method(ngx.HTTP_HEAD)
    ngx.req.set_uri(path)
end

function rest:put(path)
    ngx.req.set_method(ngx.HTTP_PUT)
    ngx.req.set_uri(path)
end

function rest:post(path)
    -- ngx.req.set_method(ngx.HTTP_POST)
    ngx.req.set_uri(path)
    ngx.req.read_body()
    local request_body = ngx.req.get_body_data()
    if request_body == nil and ngx.req.get_method ~= ngx.HTTP_POST then
        -- ngx.say("sssssssss")
        ngx.status = ngx.HTTP_NOT_ALLOWED -- 405
        ngx.say("METHOD NOT ALLOWED")
        -- to cause quit the whole request rather than the current phase handler
        ngx.exit(ngx.HTTP_NOT_ALLOWED)
    else
        self:set_response(request_body, 200)
    end
end

function rest:delete(path)
    ngx.req.set_method(ngx.HTTP_DELETE)
    ngx.req.set_uri(path)
end

function rest:options(path)
    ngx.req.set_method(ngx.HTTP_OPTIONS)
    ngx.req.set_uri(path)
end

function rest:patch(path)
    ngx.req.set_method(ngx.HTTP_PATCH)
    ngx.req.set_uri(path)
end

-- rest:post("/google")

--
