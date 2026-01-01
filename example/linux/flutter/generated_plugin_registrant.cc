//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <get_info/get_info_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) get_info_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "GetInfoPlugin");
  get_info_plugin_register_with_registrar(get_info_registrar);
}
