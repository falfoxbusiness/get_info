#include "include/get_info/get_info_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "get_info_plugin.h"

void GetInfoPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  get_info::GetInfoPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
