// Compiled by Lona Version 0.5.2

import UIKit
import Foundation

// MARK: - AccessibilityVisibility

public class AccessibilityVisibility: UIView {

  // MARK: Lifecycle

  public init(_ parameters: Parameters) {
    self.parameters = parameters

    super.init(frame: .zero)

    setUpViews()
    setUpConstraints()

    update()
  }

  public convenience init(showText: Bool) {
    self.init(Parameters(showText: showText))
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

  public var showText: Bool {
    get { return parameters.showText }
    set {
      if parameters.showText != newValue {
        parameters.showText = newValue
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

  private var greyBoxView = UIView(frame: .zero)
  private var textView = UILabel()

  private var textViewTextStyle = TextStyles.body1

  private var greyBoxViewBottomAnchorBottomAnchorConstraint: NSLayoutConstraint?
  private var textViewBottomAnchorBottomAnchorConstraint: NSLayoutConstraint?
  private var textViewTopAnchorGreyBoxViewBottomAnchorConstraint: NSLayoutConstraint?
  private var textViewLeadingAnchorLeadingAnchorConstraint: NSLayoutConstraint?
  private var textViewTrailingAnchorTrailingAnchorConstraint: NSLayoutConstraint?

  private func setUpViews() {
    textView.isUserInteractionEnabled = false
    textView.numberOfLines = 0

    addSubview(greyBoxView)
    addSubview(textView)

    isAccessibilityElement = false
    accessibilityElements = [greyBoxView, textView]
    greyBoxView.backgroundColor = #colorLiteral(red: 0.847058823529, green: 0.847058823529, blue: 0.847058823529, alpha: 1)
    greyBoxView.isAccessibilityElement = true
    greyBoxView.accessibilityLabel = "Grey box"
    textView.attributedText = textViewTextStyle.apply(to: "Sometimes hidden")
    textView.isAccessibilityElement = true
    textView.accessibilityLabel = "Some text that is sometimes hidden"
  }

  private func setUpConstraints() {
    translatesAutoresizingMaskIntoConstraints = false
    greyBoxView.translatesAutoresizingMaskIntoConstraints = false
    textView.translatesAutoresizingMaskIntoConstraints = false

    let greyBoxViewTopAnchorConstraint = greyBoxView.topAnchor.constraint(equalTo: topAnchor)
    let greyBoxViewLeadingAnchorConstraint = greyBoxView.leadingAnchor.constraint(equalTo: leadingAnchor)
    let greyBoxViewHeightAnchorConstraint = greyBoxView.heightAnchor.constraint(equalToConstant: 40)
    let greyBoxViewWidthAnchorConstraint = greyBoxView.widthAnchor.constraint(equalToConstant: 100)
    let greyBoxViewBottomAnchorBottomAnchorConstraint = greyBoxView.bottomAnchor.constraint(equalTo: bottomAnchor)
    let textViewBottomAnchorBottomAnchorConstraint = textView.bottomAnchor.constraint(equalTo: bottomAnchor)
    let textViewTopAnchorGreyBoxViewBottomAnchorConstraint = textView
      .topAnchor
      .constraint(equalTo: greyBoxView.bottomAnchor)
    let textViewLeadingAnchorLeadingAnchorConstraint = textView.leadingAnchor.constraint(equalTo: leadingAnchor)
    let textViewTrailingAnchorTrailingAnchorConstraint = textView
      .trailingAnchor
      .constraint(lessThanOrEqualTo: trailingAnchor)

    self.greyBoxViewBottomAnchorBottomAnchorConstraint = greyBoxViewBottomAnchorBottomAnchorConstraint
    self.textViewBottomAnchorBottomAnchorConstraint = textViewBottomAnchorBottomAnchorConstraint
    self.textViewTopAnchorGreyBoxViewBottomAnchorConstraint = textViewTopAnchorGreyBoxViewBottomAnchorConstraint
    self.textViewLeadingAnchorLeadingAnchorConstraint = textViewLeadingAnchorLeadingAnchorConstraint
    self.textViewTrailingAnchorTrailingAnchorConstraint = textViewTrailingAnchorTrailingAnchorConstraint

    NSLayoutConstraint.activate(
      [
        greyBoxViewTopAnchorConstraint,
        greyBoxViewLeadingAnchorConstraint,
        greyBoxViewHeightAnchorConstraint,
        greyBoxViewWidthAnchorConstraint
      ] +
        conditionalConstraints(textViewIsHidden: textView.isHidden))
  }

  private func conditionalConstraints(textViewIsHidden: Bool) -> [NSLayoutConstraint] {
    var constraints: [NSLayoutConstraint?]

    switch (textViewIsHidden) {
      case (true):
        constraints = [greyBoxViewBottomAnchorBottomAnchorConstraint]
      case (false):
        constraints = [
          textViewBottomAnchorBottomAnchorConstraint,
          textViewTopAnchorGreyBoxViewBottomAnchorConstraint,
          textViewLeadingAnchorLeadingAnchorConstraint,
          textViewTrailingAnchorTrailingAnchorConstraint
        ]
    }

    return constraints.compactMap({ $0 })
  }

  private func update() {
    let textViewIsHidden = textView.isHidden

    textView.isHidden = !showText

    if textView.isHidden != textViewIsHidden {
      NSLayoutConstraint.deactivate(conditionalConstraints(textViewIsHidden: textViewIsHidden))
      NSLayoutConstraint.activate(conditionalConstraints(textViewIsHidden: textView.isHidden))
      accessibilityElements = [greyBoxView, textView].filter({
            !$0.isHidden
          })
    }
  }
}

// MARK: - Parameters

extension AccessibilityVisibility {
  public struct Parameters: Equatable {
    public var showText: Bool

    public init(showText: Bool) {
      self.showText = showText
    }

    public init() {
      self.init(showText: false)
    }

    public static func ==(lhs: Parameters, rhs: Parameters) -> Bool {
      return lhs.showText == rhs.showText
    }
  }
}

// MARK: - Model

extension AccessibilityVisibility {
  public struct Model: LonaViewModel, Equatable {
    public var id: String?
    public var parameters: Parameters
    public var type: String {
      return "AccessibilityVisibility"
    }

    public init(id: String? = nil, parameters: Parameters) {
      self.id = id
      self.parameters = parameters
    }

    public init(_ parameters: Parameters) {
      self.parameters = parameters
    }

    public init(showText: Bool) {
      self.init(Parameters(showText: showText))
    }

    public init() {
      self.init(showText: false)
    }
  }
}
