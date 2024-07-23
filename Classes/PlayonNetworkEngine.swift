import Flutter
import FlutterPluginRegistrant

public typealias AddFundsResult = (Bool?) -> ();
public typealias OnRequestAddFundsListener = (Int, @escaping AddFundsResult) -> ();

public typealias AuthTokenResult = (String?) -> ();
public typealias OnAuthTokenErrorListener = (String, @escaping AuthTokenResult) -> ();

public class PlayonNetworkEngine {
  private static let kId: String = "PlayonNetworkEngine";

  private var _authToken: String;
  private var _onAuthTokenError: OnAuthTokenErrorListener?;
  private var _onAddFunds: OnRequestAddFundsListener?;
  private var _flutterEngine: FlutterEngine;

  init(
    authToken: String,
    onAuthTokenError: @escaping OnAuthTokenErrorListener,
    onRequestAddFunds: @escaping OnRequestAddFundsListener
  ) {
    self._authToken = authToken;
    self._onAuthTokenError = onAuthTokenError;
    self._onRequestAddFunds = onRequestAddFunds;
    self._flutterEngine = FlutterEngine(name: PlayonNetworkEngine.kId);
    self._flutterEngine.run();

    GeneratedPluginRegistrant.register(with: self._flutterEngine);
    PlayonNetworkEnginePlugin.register(with: self._flutterEngine.registrar(forPlugin: "PlayonNetworkEnginePlugin")!)
  }

  public var authToken: String {
    return self._authToken;
  }

  public var flutterEngine: FlutterEngine {
    return self._flutterEngine;
  }

  public var onAuthTokenError: OnAuthTokenErrorListener? {
    get {
      return self._onAuthTokenError;
    }

    set {
      self._onAuthTokenError = newValue;
    }
  }

  public var onRequestAddFunds: OnRequestAddFundsListener? {
    get {
      return self._onRequestAddFunds;
    }

    set {
      self._onRequestAddFunds = newValue;
    }
  }
}
