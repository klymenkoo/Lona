// Compiled by Lona Version 0.5.2

import AppKit
import Foundation

// MARK: - InlineVariantTest

public class InlineVariantTest: NSBox {

  // MARK: Lifecycle

  public init(_ parameters: Parameters) {
    self.parameters = parameters

    super.init(frame: .zero)

    setUpViews()
    setUpConstraints()

    update()
  }

  public convenience init(type: ItemType) {
    self.init(Parameters(type: type))
  }

  public convenience init() {
    self.init(Parameters())
  }

  public required init?(coder aDecoder: NSCoder) {
    self.parameters = Parameters()

    super.init(coder: aDecoder)

    setUpViews()
    setUpConstraints()

    update()
  }

  // MARK: Public

  public var type: ItemType {
    get { return parameters.type }
    set {
      if parameters.type != newValue {
        parameters.type = newValue
      }
    }
  }

  public var parameters: Parameters {
    didSet {
      if parameters != oldValue {
        update()
      }
    }
  }

  // MARK: Private

  private var textView = LNATextField(labelWithString: "")

  private var textViewTextStyle = TextStyles.body1

  private func setUpViews() {
    boxType = .custom
    borderType = .noBorder
    contentViewMargins = .zero
    textView.lineBreakMode = .byWordWrapping

    addSubview(textView)

    textView.attributedStringValue = textViewTextStyle.apply(to: "Text")
  }

  private func setUpConstraints() {
    translatesAutoresizingMaskIntoConstraints = false
    textView.translatesAutoresizingMaskIntoConstraints = false

    let textViewTopAnchorConstraint = textView.topAnchor.constraint(equalTo: topAnchor, constant: 4)
    let textViewBottomAnchorConstraint = textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
    let textViewLeadingAnchorConstraint = textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
    let textViewTrailingAnchorConstraint = textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)

    NSLayoutConstraint.activate([
      textViewTopAnchorConstraint,
      textViewBottomAnchorConstraint,
      textViewLeadingAnchorConstraint,
      textViewTrailingAnchorConstraint
    ])
  }

  private func update() {
    fillColor = Colors.blue100
    if type == .error {
      fillColor = Colors.red100
    }
  }
}

// MARK: - Parameters

extension InlineVariantTest {
  public struct Parameters: Equatable {
    public var type: ItemType

    public init(type: ItemType) {
      self.type = type
    }

    public init() {
      self.init(type: .standard)
    }

    public static func ==(lhs: Parameters, rhs: Parameters) -> Bool {
      return lhs.type == rhs.type
    }
  }
}

// MARK: - Model

extension InlineVariantTest {
  public struct Model: LonaViewModel, Equatable {
    public var id: String?
    public var parameters: Parameters
    public var type: String {
      return "InlineVariantTest"
    }

    public init(id: String? = nil, parameters: Parameters) {
      self.id = id
      self.parameters = parameters
    }

    public init(_ parameters: Parameters) {
      self.parameters = parameters
    }

    public init(type: ItemType) {
      self.init(Parameters(type: type))
    }

    public init() {
      self.init(type: .standard)
    }
  }
}

// MARK: - ItemType

extension InlineVariantTest {
  public enum ItemType: Codable & Equatable {
    case standard
    case error

    // MARK: Codable

    public init(from decoder: Decoder) throws {
      let container = try decoder.singleValueContainer()
      let type = try container.decode(Bool.self)

      switch type {
        case false:
          self = .standard
        case true:
          self = .error
      }
    }

    public func encode(to encoder: Encoder) throws {
      var container = encoder.singleValueContainer()

      switch self {
        case .standard:
          try container.encode(false)
        case .error:
          try container.encode(true)
      }
    }
  }
}
