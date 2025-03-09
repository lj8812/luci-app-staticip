local m, s, o

m = Map("network", translate("Static IP Configuration"), 
    translate("Configure static IP address, MAC binding, gateway and DNS settings."))

s = m:section(TypedSection, "interface", translate("Network Interface"))
s.template = "cbi/tblsection"
s.anonymous = true
s.addremove = false

-- 接口选择
s:option(Value, "ifname", translate("Interface Name")).rmempty = false

-- 静态IP配置
o = s:option(Value, "ipaddr", translate("IP Address"))
o.datatype = "ip4addr"
o.rmempty = false

o = s:option(Value, "netmask", translate("Netmask"))
o.datatype = "ip4addr"
o.rmempty = false

-- MAC地址绑定
o = s:option(Value, "macaddr", translate("MAC Address"))
o.datatype = "macaddr"

-- 网关配置
o = s:option(Value, "gateway", translate("Gateway"))
o.datatype = "ip4addr"

-- DNS配置（支持多DNS服务器）
dns = s:option(DynamicList, "dns", translate("DNS Servers"))
dns.datatype = "ip4addr"
dns.placeholder = "8.8.8.8 8.8.4.4"

-- 实时生效配置
function m.on_apply(self)
    luci.sys.call("uci commit network")
    luci.sys.call("/etc/init.d/network reload")
    luci.http.redirect(luci.dispatcher.build_url("admin/services/staticip"))
end

return m
