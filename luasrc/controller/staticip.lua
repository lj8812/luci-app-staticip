module("luci.controller.staticip", package.seeall)

function index()
    entry({"admin", "services", "staticip"}, cbi("staticip"), _("Static IP 配置"), 60)
end
