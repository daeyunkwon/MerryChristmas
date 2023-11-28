//
//  ViewController.swift
//  MerryChristmas
//
//  Created by 권대윤.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lottieView: LottieAnimationView!
    
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLottieView()
        setupLabel()
        setupTimer()
    }
    
    
    func setupLottieView() {
        lottieView.animation = LottieAnimation.named("snowFall")
        
        lottieView.contentMode = .scaleAspectFill
        
        lottieView.loopMode = .loop
        lottieView.play()
    }
    
    
    func setupLabel() {
        mainLabel.textColor = .white
        
        self.mainLabel.text = """
        Merry
        Christmas🎄⛄️
        """
        
        //NSMutableAttributedString을 이용해 특정 단어 색상 변경하기
        let attributedStr = NSMutableAttributedString(string: self.mainLabel.text!)
        
        attributedStr.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: (self.mainLabel.text! as NSString).range(of: "M"))
        attributedStr.addAttribute(.foregroundColor, value: UIColor.systemPink, range: (self.mainLabel.text! as NSString).range(of: "C"))
        
        mainLabel.attributedText = attributedStr
    }
    
    
    func setupTimer() {
        //timeInterval 초 경과 시마다 addLetterToTitleLabel 메서드 실행하는 타이머
        timer = Timer.scheduledTimer(timeInterval: 8.0, target: self, selector: #selector(addLetterToTitleLabel), userInfo: nil, repeats: true)
    }
    
    
    //타이머에 의해 실행되는 메서드
    //Label에 한글자씩 입력되는 애니메이션을 주기 위한 메서드
    @objc func addLetterToTitleLabel() {
        //print(#function)
        
        self.mainLabel.text = ""
        
        let mainText = """
        Merry
        Christmas🎄⛄️
        """
        
        var sec = 0.15
        
        for character in mainText {
            DispatchQueue.main.asyncAfter(deadline: .now()+sec) {
                self.mainLabel.text?.append(character)
            
                // NSMutableAttributedString Type으로 바꾼 text를 저장
                let attributedStr = NSMutableAttributedString(string: self.mainLabel.text!)
                
                self.mainLabel.textColor = .white
                
                attributedStr.addAttribute(.foregroundColor, value: UIColor.systemGreen, range: (self.mainLabel.text! as NSString).range(of: "M"))
                
                attributedStr.addAttribute(.foregroundColor, value: UIColor.systemPink, range: (self.mainLabel.text! as NSString).range(of: "C"))

                // 설정이 적용된 text를 label의 attributedText에 저장
                self.mainLabel.attributedText = attributedStr
            }
            sec += 0.15
            
        }
    }
    
    
    
    
    
    
}
