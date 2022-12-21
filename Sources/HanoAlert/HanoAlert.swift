import UIKit

@available(iOS 13.0, *)
public enum HanoAlertButtonStyle {
    case twoButton
    case oneButton
}

@available(iOS 13.0, *)
open class HanoAlert: UIView {
    private let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 18, weight: .semibold)
        view.numberOfLines = 1
        return view
    }()
    
    private let decriptionLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .center
        view.font =  .systemFont(ofSize: 14, weight: .medium)
        view.numberOfLines = 0
        return view
    }()
    
    private let confirmButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 0.6705638112, green: 0.8669828945, blue: 1, alpha: 1)
        view.titleLabel?.numberOfLines = 1
        view.titleLabel?.textAlignment = .center
        view.clipsToBounds = true
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    private let cancelButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        view.titleLabel?.numberOfLines = 1
        view.titleLabel?.textAlignment = .center
        view.clipsToBounds = true
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    private var title: String?
    private var message: String?
    private var confirm: String?
    private var cancel: String?
    private var font: UIFont?
    private var confirmColor: UIColor = #colorLiteral(red: 0.6705638112, green: 0.8669828945, blue: 1, alpha: 1)
    private var buttonStyle: HanoAlertButtonStyle = .twoButton
    private var completionHandler: (() -> Void)?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        alertView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        decriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    ///Two Button
    public convenience init(title: String? = nil,
                            message: String,
                            confirm: String,
                            cancel: String,
                            font: UIFont? = nil,
                            buttonStyle: HanoAlertButtonStyle,
                            completionHandler: (() -> Void)?) {
        self.init(frame: CGRect.zero)
        self.title = title
        self.message = message
        self.confirm = confirm
        self.cancel = cancel
        self.buttonStyle = buttonStyle
        self.completionHandler = completionHandler
    }
    
    ///One Button
    public convenience init(title: String? = nil,
                            message: String,
                            confirm: String,
                            font: UIFont? = nil,
                            buttonStyle: HanoAlertButtonStyle,
                            completionHandler: (() -> Void)?) {
        self.init(frame: CGRect.zero)
        self.title = title
        self.message = message
        self.confirm = confirm
        self.buttonStyle = buttonStyle
        self.completionHandler = completionHandler
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func showAlert(_ superView: UIView) {
        setAttributes()
        configureUI(superView)
        setConstraints(superView)
        pop()
    }
    
    private func configureUI(_ superView: UIView) {
        superView.addSubview(self)
        self.addSubview(alertView)
        [titleLabel, decriptionLabel].forEach {
            alertView.addSubview($0)
        }
    }
    
    private func setConstraints(_ superView: UIView) {
        self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        
        alertView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        alertView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        alertView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        alertView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor).isActive = true
        
        decriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15).isActive = true
        decriptionLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor, constant: 10).isActive = true
        decriptionLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor, constant: -10).isActive = true
        decriptionLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 30).isActive = true
        
        switch buttonStyle {
        case .twoButton:
            alertView.addSubview(cancelButton)
            alertView.addSubview(confirmButton)
            cancelButton.leadingAnchor.constraint(equalTo: alertView.leadingAnchor).isActive = true
            cancelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
            cancelButton.widthAnchor.constraint(equalTo: alertView.widthAnchor, multiplier: 0.5).isActive = true
            cancelButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor).isActive = true
            
            confirmButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor).isActive = true
            confirmButton.heightAnchor.constraint(equalTo: cancelButton.heightAnchor).isActive = true
            confirmButton.leadingAnchor.constraint(equalTo: cancelButton.trailingAnchor).isActive = true
            confirmButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor).isActive = true
        case .oneButton:
            alertView.addSubview(confirmButton)
            confirmButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor).isActive = true
            confirmButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
            confirmButton.leadingAnchor.constraint(equalTo: alertView.leadingAnchor).isActive = true
            confirmButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor).isActive = true
        }
    }
    
    private func setAttributes() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        titleLabel.text = title ?? ""
        decriptionLabel.text = message ?? ""
        confirmButton.setTitle(confirm ?? "", for: .normal)
        cancelButton.setTitle(cancel ?? "", for: .normal)
        
        setFont()
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    private func setFont() {
        guard let font = font else { return }
        titleLabel.font = font
        decriptionLabel.font = font
        confirmButton.titleLabel?.font = font
        cancelButton.titleLabel?.font = font
    }
    
    @objc private func confirmButtonTapped() {
        dismiss()
        completionHandler?()
    }
    
    @objc private func cancelButtonTapped() {
        dismiss()
    }
    
    private func pop() {
        alertView.alpha = 0
        
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            self.alertView.alpha = 1
        }
    }
    
    private func dismiss() {
        UIView.animate(withDuration: 0.2) { [weak self] in
            guard let self = self else { return }
            self.backgroundColor = .clear
            self.alertView.alpha = 0
        } completion: { [weak self] _ in
            guard let self = self else { return }
            self.removeFromSuperview()
        }
    }
}
