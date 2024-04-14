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


/*
 
 //
 //  ViewController.swift
 //  test
 //
 //  Created by 김지원 on 3/25/24.
 //

 import UIKit

 // view의 생명주기
 // 1. 변수 추가
 // 2. view에 넣어주고
 // 3. 레이아웃 잡아주고
 // 4. 레이블, 버튼 셋팅을 해준다

 class ViewController: UIViewController {
     
 //    private let tableView = UITableView()
     private let playButton: UIButton = UIButton(type: .roundedRect)
     
     private let label: UILabel = UILabel.init(frame: .zero)
     private let label2: UILabel = UILabel.init(frame: .zero)
     private let uiViewController: UINavigationController = .init()
     private let imageView1 = UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
     private let imageView2 = UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
     private let imageView3 = UIImageView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
     private let imageView4 = UIImageView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))

     private let image1 = UIImage(named: "sissor")
     private let image2 = UIImage(named: "rock")
     private let image3 = UIImage(named: "paper")
     private let image4 = UIImage(named: "question")
     
     private var isBorderHighlighted1 = false
     private var isBorderHighlighted2 = false

     private var isBorderHighlighted3 = false

     
     // model
     private let user: User = .init()
         
     override func viewDidLoad() {
        
         super.viewDidLoad()
         view.backgroundColor = .white
         setPlayButton()
         setMyLabel()
         setImage1()
         setImage2()
         setImage3()
         setImage4()
     }
     
 }

 extension ViewController {
     
     
     private func setMyLabel() {
         view.addSubview(label)
         view.addSubview(label2)
         
         label.text = "컴퓨터"
         label.translatesAutoresizingMaskIntoConstraints = false
         label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         label.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: -250).isActive = true
         
         /*label2.text = "가위     바위     보"
         label2.translatesAutoresizingMaskIntoConstraints = false
         label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         label.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: 100).isActive = true
         */

     }
     
     private func setPlayButton() {
         view.addSubview(playButton)
         
         playButton.translatesAutoresizingMaskIntoConstraints = false
         playButton.widthAnchor.constraint(equalToConstant: 340).isActive = true
         playButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
         playButton.setTitle("Play", for: .normal)
         playButton.setTitleColor(.white, for: .normal)
         playButton.backgroundColor = .blue
         playButton.layer.cornerRadius = 10
         playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true //수평 중앙정렬
         playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true //수직 중앙정렬
         playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
     }
     
     @objc func playButtonTapped() {
         
     }
     
     private func setImage1() {
         view.addSubview(imageView1)
         
         imageView1.image = image1
         imageView1.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
             // 이미지 뷰의 왼쪽을 playButton 왼쪽에 맞춤
             imageView1.leadingAnchor.constraint(equalTo: playButton.leadingAnchor),
             // 이미지 뷰의 아래를 playButton 위로 20포인트 간격으로 조정
             imageView1.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 50),
             // 이미지 뷰의 너비와 높이를 100포인트로 설정 (예시)
             imageView1.widthAnchor.constraint(equalToConstant: 100),
             imageView1.heightAnchor.constraint(equalToConstant: 100)
         ])
         
         imageView1.layer.borderWidth = 1.0 // 테두리 두께 설정
         imageView1.layer.borderColor = UIColor.gray.cgColor // 테두리 색상 설정
         imageView1.layer.cornerRadius = 10.0 // 이미지 뷰의 모서리를 둥글게 설정 (선택사항)
         imageView1.layer.masksToBounds = true // 이미지 뷰의 내용이 모서리를 벗어나지 않도록 설정
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
         imageView1.isUserInteractionEnabled = true
         imageView1.addGestureRecognizer(tapGesture)
     }
     
     private func setImage2() {
         view.addSubview(imageView2)
         
         imageView2.image = image2
         imageView2.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
         imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: 20),
             // 이미지 뷰의 아래를 playButton 위로 20포인트 간격으로 조정
             imageView2.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 50),
             // 이미지 뷰의 너비와 높이를 100포인트로 설정 (예시)
             imageView2.widthAnchor.constraint(equalToConstant: 100),
             imageView2.heightAnchor.constraint(equalToConstant: 100)
         ])
         
         imageView2.layer.borderWidth = 1.0 // 테두리 두께 설정
         imageView2.layer.borderColor = UIColor.gray.cgColor // 테두리 색상 설정
         imageView2.layer.cornerRadius = 10.0 // 이미지 뷰의 모서리를 둥글게 설정 (선택사항)
         imageView2.layer.masksToBounds = true // 이미지 뷰의 내용이 모서리를 벗어나지 않도록 설정
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
         imageView2.isUserInteractionEnabled = true
         imageView2.addGestureRecognizer(tapGesture)
     }
     
     private func setImage3() {
         view.addSubview(imageView3)
         
         imageView3.image = image3
         imageView3.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
         imageView3.leadingAnchor.constraint(equalTo: imageView2.trailingAnchor, constant: 20),
             // 이미지 뷰의 아래를 playButton 위로 20포인트 간격으로 조정
             imageView3.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 50),
             // 이미지 뷰의 너비와 높이를 100포인트로 설정 (예시)
             imageView3.widthAnchor.constraint(equalToConstant: 100),
             imageView3.heightAnchor.constraint(equalToConstant: 100)
         ])
         
         imageView3.layer.borderWidth = 1.0 // 테두리 두께 설정
         imageView3.layer.borderColor = UIColor.gray.cgColor // 테두리 색상 설정
         imageView3.layer.cornerRadius = 10.0 // 이미지 뷰의 모서리를 둥글게 설정 (선택사항)
         imageView3.layer.masksToBounds = true // 이미지 뷰의 내용이 모서리를 벗어나지 않도록 설정
         let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
         imageView3.isUserInteractionEnabled = true
         imageView3.addGestureRecognizer(tapGesture)
     }
     
     private func setImage4() {
         view.addSubview(imageView4)
         
         imageView4.image = image4
         imageView4.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
                 // imageView4를 뷰의 수평 중앙에 위치시킴
                 imageView4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                 // imageView4의 아래쪽을 playButton의 위쪽에 위치시킴 (수직 간격은 50포인트)
                 imageView4.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: -40),
                 // imageView4의 너비와 높이를 각각 200포인트로 설정
                 imageView4.widthAnchor.constraint(equalToConstant: 200),
                 imageView4.heightAnchor.constraint(equalToConstant: 200)
             ])
         
         imageView4.layer.borderWidth = 1.0 // 테두리 두께 설정
         imageView4.layer.borderColor = UIColor.gray.cgColor // 테두리 색상 설정
         imageView4.layer.cornerRadius = 10.0 // 이미지 뷰의 모서리를 둥글게 설정 (선택사항)
         imageView4.layer.masksToBounds = true // 이미지 뷰의 내용이 모서리를 벗어나지 않도록 설정
     }
     
     @objc func imageViewTapped(_ sender: UITapGestureRecognizer) {
             if let tappedImageView = sender.view as? UIImageView {
                 // 해당하는 이미지 뷰의 토글 상태를 변경하고 테두리 색을 업데이트
                 switch tappedImageView {
                 case imageView1:
                     isBorderHighlighted1.toggle()
                     updateImageViewBorder(tappedImageView, isHighlighted: isBorderHighlighted1)
                 case imageView2:
                     isBorderHighlighted2.toggle()
                     updateImageViewBorder(tappedImageView, isHighlighted: isBorderHighlighted2)
                 case imageView3:
                     isBorderHighlighted3.toggle()
                     updateImageViewBorder(tappedImageView, isHighlighted: isBorderHighlighted3)
                 default:
                     break
                 }
             }
         }

         private func updateImageViewBorder(_ imageView: UIImageView, isHighlighted: Bool) {
             // 토글 상태에 따라 테두리 색 업데이트
             if isHighlighted {
                 imageView.layer.borderColor = UIColor.blue.cgColor
                 imageView.layer.borderWidth = 2.0
             } else {
                 imageView.layer.borderColor = UIColor.gray.cgColor
                 imageView.layer.borderWidth = 1.0
             }
         }
     }


 */
