include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-staticip
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-staticip
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=Static IP Configuration Plugin
  DEPENDS:=+luci-base
  PKGARCH:=all
endef

define Package/luci-app-staticip/description
  LuCI plugin for configuring static IP, MAC address, gateway and DNS
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-staticip/install
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
    $(INSTALL_DATA) ./luasrc/controller/staticip.lua $(1)/usr/lib/lua/luci/controller/
    $(INSTALL_DATA) ./luasrc/model/cbi/staticip.lua $(1)/usr/lib/lua/luci/model/cbi/
endef

$(eval $(call BuildPackage,luci-app-staticip))
