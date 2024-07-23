import Flutter

public class PlayonNetwork {
  private static var _engine: PlayonNetworkEngine?;

  public static var engine: PlayonNetworkEngine? {
    return self._engine;
  }

  public static func initializeEngine(
    authToken: String,
    onAuthTokenError: @escaping OnAuthTokenErrorListener,
    onRequestAddFunds: @escaping OnRequestAddFundsListener
  ) -> PlayonNetworkEngine {
    if (self._engine == nil) {
      self._engine = PlayonNetworkEngine(
        authToken: authToken,
        onAuthTokenError: onAuthTokenError,
        onRequestAddFunds: onRequestAddFunds
      );
    }

    return self._engine!;
  }

  public static func createFantasyViewController() -> UIViewController {
    let viewController = FlutterViewController(
      engine: self._engine!.flutterEngine,
      nibName: nil,
      bundle: nil
    );

    viewController.modalPresentationStyle = .overCurrentContext;
    viewController.isViewOpaque = false;

    return viewController;
  }
}
