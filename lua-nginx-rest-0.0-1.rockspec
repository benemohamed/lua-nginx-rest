package = "lua-nginx-rest"
version = "0.0-1"
source = {
   url = "git://github.com/benemohamed/lua-nginx-rest.git"
}
description = {
   summary = "rest library for Nginx",
   homepage = "https://github.com/benemohamed/lua-nginx-rest",
   license = "MIT",
   maintainer = "mohamed@ipfinder.io"
}
dependencies = {
   "lua >= 5.1",
}
build = {
   type    = "builtin",
   modules = {
      ["rest"] = "rest/rest.lua"
   }
}