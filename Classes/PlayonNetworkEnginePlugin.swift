import Flutter

public class PlayonNetworkEnginePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: any FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "playon.network/engine", binaryMessenger: registrar.messenger())
    let instance = PlayonNetworkEnginePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "getAuthToken":
        result(getAuthToken())

      case "requestNewAuthToken":
        requestNewAuthToken(errorCode: call.arguments as! String, onCompletion: { (token: String?) in
          result(token);
        });

      case "requestAddFunds":
        requestAddFunds(amount: call.arguments as! Int, onCompletion: { (funded: Bool?) in
          result(funded);
        });

      default:
        result(FlutterMethodNotImplemented)
    }
  }

  private func getAuthToken() -> String {
    return PlayonNetwork.engine!.authToken;
  }

  private func requestNewAuthToken(errorCode: String, onCompletion: @escaping AuthTokenResult) {
    PlayonNetwork.engine!.onAuthTokenError?(errorCode, onCompletion);
  }

  private func requestAddFunds(amount: Int, onCompletion: @escaping AddFundsResult) {
    PlayonNetwork.engine!.onRequestAddFunds?(amount, onCompletion);
  }
}
