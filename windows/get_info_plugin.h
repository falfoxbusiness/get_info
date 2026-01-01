#ifndef FLUTTER_PLUGIN_GET_INFO_PLUGIN_H_
#define FLUTTER_PLUGIN_GET_INFO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace get_info {

class GetInfoPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  GetInfoPlugin();

  virtual ~GetInfoPlugin();

  // Disallow copy and assign.
  GetInfoPlugin(const GetInfoPlugin&) = delete;
  GetInfoPlugin& operator=(const GetInfoPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace get_info

#endif  // FLUTTER_PLUGIN_GET_INFO_PLUGIN_H_
