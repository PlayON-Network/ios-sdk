import Flutter

public class PlayonNetwork {
  private static var _engine: PlayonNetworkEngine?;
  private static var _fantasyViewController: UIViewController?;

  public static var engine: PlayonNetworkEngine? {
    return self._engine;
  }

  public static var fantasyViewController: UIViewController? {
    return self._fantasyViewController;
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
    if (self._fantasyViewController == nil) {
      let viewController = FlutterViewController(
        engine: self._engine!.flutterEngine,
        nibName: nil,
        bundle: nil
      );

      viewController.modalPresentationStyle = .overCurrentContext;
      viewController.isViewOpaque = false;

      self._fantasyViewController = viewController;
    }

    return self._fantasyViewController!;
  }
}
