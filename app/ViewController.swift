//
//  ViewController.swift
//  app
//
//  Created by 김지원 on 4/1/24.
//

import UIKit

class ViewController: UIViewController {
    
//    private let tableView = UITableView()
    private let rcButton: UIButton = UIButton(type: .roundedRect)
    private let appleButton: UIButton = UIButton(type: .roundedRect)
    private let bananaButton: UIButton = UIButton(type: .roundedRect)
    private let limeButton: UIButton = UIButton(type: .roundedRect)
    private let grapeButton: UIButton = UIButton(type: .roundedRect)
    
    private let label: UILabel = UILabel.init(frame: .zero)
    private let label2: UILabel = UILabel.init(frame: .zero)
    private let uiViewController: UINavigationController = .init()
    private let imageView = UIImageView(frame: CGRect(x: 100, y: 300, width: 200, height: 200))

    private let image1 = UIImage(named: "apple")
    private let image2 = UIImage(named: "banana")
    private let image3 = UIImage(named: "lime")
    private let image4 = UIImage(named: "grape")
    
    // model
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setRcButton()
        setMyLabel()
        setupImageView()
        setupFruitButtons()
    }
    
}

extension ViewController {
    
    private func setMyLabel() {
        view.addSubview(label)
        
        label.text = "닉네임"
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // 닉네임 라벨의 오른쪽을 RC 버튼의 왼쪽에 맞춥니다. (일정 간격을 두고 배치)
            label.trailingAnchor.constraint(equalTo: rcButton.leadingAnchor, constant: -190),
            // 닉네임 라벨의 세로 중앙을 RC 버튼의 세로 중앙에 맞춥니다.
            label.centerYAnchor.constraint(equalTo: rcButton.centerYAnchor)
        ])
        
    }
    
    private func setRcButton() {
        view.addSubview(rcButton)
        
        rcButton.translatesAutoresizingMaskIntoConstraints = false
        rcButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        rcButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        rcButton.setTitle("추천", for: .normal)
        rcButton.setTitleColor(.white, for: .normal)
        rcButton.backgroundColor = .blue
        rcButton.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            // 버튼의 오른쪽을 본 화면의 오른쪽에 맞춥니다.
            rcButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            // 버튼의 상단을 본 화면의 상단에 맞춥니다.
            rcButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
        ])
    }
    
    private func setupImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .lightGray
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: rcButton.bottomAnchor, constant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupFruitButtons() {
        let buttons = [appleButton, bananaButton, limeButton, grapeButton]
        let fruits = ["apple", "banana", "lime", "grape"]
        
        for (index, button) in buttons.enumerated() {
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(fruits[index].capitalized, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .gray
            button.layer.cornerRadius = 10
            button.tag = index // 버튼에 태그 지정
            
            button.addTarget(self, action: #selector(fruitButtonTapped(_:)), for: .touchUpInside)
            
            view.addSubview(button)
            
            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50 + CGFloat(index * 80)),
                button.topAnchor.constraint(equalTo: rcButton.bottomAnchor, constant: 30),
                button.widthAnchor.constraint(equalToConstant: 70),
                button.heightAnchor.constraint(equalToConstant: 30)
            ])
        }
    }
    
    @objc private func fruitButtonTapped(_ sender: UIButton) {
        // 버튼 태그를 이용하여 해당하는 이미지를 이미지 뷰에 설정
        switch sender.tag {
        case 0:
            imageView.image = image1
            appleButton.backgroundColor = .blue
            bananaButton.backgroundColor = .gray
            limeButton.backgroundColor = .gray
            grapeButton.backgroundColor = .gray
        case 1:
            imageView.image = image2
            appleButton.backgroundColor = .gray
            bananaButton.backgroundColor = .blue
            limeButton.backgroundColor = .gray
            grapeButton.backgroundColor = .gray
        case 2:
            imageView.image = image3
            appleButton.backgroundColor = .gray
            bananaButton.backgroundColor = .gray
            limeButton.backgroundColor = .blue
            grapeButton.backgroundColor = .gray
        case 3:
            imageView.image = image4
            appleButton.backgroundColor = .gray
            bananaButton.backgroundColor = .gray
            limeButton.backgroundColor = .gray
            grapeButton.backgroundColor = .blue
        default:
            break
        }
    }
}
