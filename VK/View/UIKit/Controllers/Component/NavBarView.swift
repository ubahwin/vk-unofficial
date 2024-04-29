import UIKit

class NavBarView: UIView {
    lazy var titleLabel: UILabel = {
        let label = UILabel()

        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.text = "Чаты"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    lazy var leftImage: UIImageView = {
        let imageView = UIImageView()

        let image = UIImage(named: "mock_image")
        imageView.image = image
        imageView.layer.cornerRadius = (imageView.frame.size.width) / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    lazy var phoneButton: UIButton = {
        let button = UIButton()

        button.setImage(UIImage(named: "phone_add_outline_28"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    lazy var newChatButton: UIButton = {
        let button = UIButton()

        button.setImage(UIImage(named: "write_blue"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureView() {
        addSubview(leftImage)
        addSubview(titleLabel)

        addSubview(phoneButton)
        addSubview(newChatButton)

        NSLayoutConstraint.activate([
            // центруем по Y
            leftImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            phoneButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            newChatButton.centerYAnchor.constraint(equalTo: centerYAnchor),

            // в рамку
            leftImage.widthAnchor.constraint(equalToConstant: 30),
            leftImage.heightAnchor.constraint(equalToConstant: 30),

            leftImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leftImage.trailingAnchor, constant: 10),
            phoneButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            newChatButton.trailingAnchor.constraint(equalTo: phoneButton.leadingAnchor, constant: -10)
        ])
    }
}
