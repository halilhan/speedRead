//
//  Exercise4.swift
//  ReadSpeed
//
//  Created by MA on 2020/1/15.
//  Copyright © 2020 mfk. All rights reserved.
//

import UIKit

class Exercise4: UIViewController {

    @IBOutlet weak var speedSlider: customThumbSlider!
    @IBOutlet weak var wordLbl1: UILabel!
    @IBOutlet weak var wordLbl2: UILabel!
    @IBOutlet weak var wordLbl3: UILabel!
    @IBOutlet weak var wordLbl4: UILabel!
    @IBOutlet weak var wordLbl5: UILabel!
    @IBOutlet weak var wordLbl6: UILabel!
    @IBOutlet weak var wordLbl7: UILabel!
    @IBOutlet weak var wordLbl8: UILabel!
    @IBOutlet weak var wordLbl9: UILabel!
    @IBOutlet weak var wordLbl10: UILabel!
    @IBOutlet weak var wordLbl11: UILabel!
    @IBOutlet weak var wordLbl12: UILabel!
    @IBOutlet weak var wordLbl13: UILabel!
    @IBOutlet weak var wordLbl14: UILabel!
    @IBOutlet weak var wordLbl15: UILabel!
    @IBOutlet weak var wordLbl16: UILabel!
    @IBOutlet weak var wordLbl17: UILabel!
    @IBOutlet weak var wordLbl18: UILabel!
    @IBOutlet weak var wordLbl19: UILabel!
    @IBOutlet weak var wordLbl20: UILabel!
    @IBOutlet weak var wordLbl21: UILabel!
    @IBOutlet weak var wordLbl22: UILabel!
    @IBOutlet weak var wordLbl23: UILabel!
    @IBOutlet weak var wordLbl24: UILabel!
    @IBOutlet weak var wordLbl25 :UILabel!
    @IBOutlet weak var wordLbl26 :UILabel!
    @IBOutlet weak var wordLbl27 :UILabel!
    @IBOutlet weak var wordLbl28 :UILabel!
    @IBOutlet weak var wordLbl29 :UILabel!
    @IBOutlet weak var wordLbl30 :UILabel!
    @IBOutlet weak var wordLbl31 :UILabel!
    @IBOutlet weak var wordLbl32 :UILabel!
    @IBOutlet weak var wordLbl33 :UILabel!
    @IBOutlet weak var wordLbl34 :UILabel!
    @IBOutlet weak var wordLbl35 :UILabel!
    @IBOutlet weak var wordLbl36 :UILabel!

    @IBOutlet weak var playpauseBtn: UIButton!
    @IBOutlet weak var timeLbl: UILabel!
            
    @IBOutlet weak var one: UIImageView!
    @IBOutlet weak var two: UIImageView!
    @IBOutlet weak var three: UIImageView!
    
    @IBOutlet weak var buttonContainerView: UIView!
    
    var timer = Timer()
    var array = [String]()
    var rowNumbers: Int = 1
    var customTimeStep: Float = 1.0
    var selectedExercises = [String]()
    var customColor: UIColor = #colorLiteral(red: 0.6106091142, green: 0.7569375634, blue: 0.3590224385, alpha: 1)
    var isPlay: Bool = false
    var counter : Int = 0
    var internalCounter: Int = 0
    var step: Float = 0
    var TrainTime: Int = 0
    var TrainTimer = Timer()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    var selectedString : String  = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedString = UserDefaults.standard.string(forKey: "exercise_problem") ?? "First Insert your training sentences. This is the default Sentences. decline globe foggy start learning speed formula crane forming singer song string hiccup system naruto configuration axilliary screen economy desk defence often ancient polics occupy map apple computer mouse"
       
        print(selectedString)
       selectedExercises = selectedString.components(separatedBy: " ")
         //
         self.speedSlider.tintColor = customColor
         self.speedSlider.maximumValue = 1.0
         self.speedSlider.minimumValue = 0.0
         self.speedSlider.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)

         let k = UserDefaults.standard.integer(forKey: "exercise3_level")
         print(k)
         self.speedSlider.value = Float(k)/100
         self.customTimeStep = 1 - Float(k)/100
         if self.customTimeStep < 0.03{ self.customTimeStep = 0.04}
         self.speedSlider.setValue(Float(k)/100, animated: true)
        
         
         step = (self.speedSlider.maximumValue - self.speedSlider.minimumValue )/100
        //
       playpauseBtn.translatesAutoresizingMaskIntoConstraints = false
        playpauseBtn.centerYAnchor.constraint(equalTo: buttonContainerView.centerYAnchor).isActive = true
        playpauseBtn.centerXAnchor.constraint(equalTo: buttonContainerView.centerXAnchor).isActive = true
        playpauseBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        playpauseBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
        playpauseBtn.layer.cornerRadius = 25
        playpauseBtn.imageView?.contentMode = .scaleAspectFill
        playpauseBtn.layer.backgroundColor = #colorLiteral(red: 0.6106091142, green: 0.7569375634, blue: 0.3590224385, alpha: 1)
        playpauseBtn.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            
        //button shadow
        let size = 50 //playpauseBtn.frame.width
        playpauseBtn.layer.shadowColor = UIColor.black.cgColor
        playpauseBtn.layer.shadowOffset = CGSize(width: 0, height: size / 6)
    //            playpauseBtn.layer.masksToBounds = false
        playpauseBtn.layer.shadowRadius = CGFloat(size / 3)
        playpauseBtn.layer.shadowOpacity = 1
        //
        timeLbl.textColor = #colorLiteral(red: 0.5086903165, green: 0.627606281, blue: 0.2984172636, alpha: 1)
        
        //label
        wordLbl1.layer.cornerRadius = 8
        wordLbl2.layer.cornerRadius = 8
        wordLbl3.layer.cornerRadius = 8
        wordLbl4.layer.cornerRadius = 8
        wordLbl5.layer.cornerRadius = 8
        wordLbl6.layer.cornerRadius = 8
        wordLbl7.layer.cornerRadius = 8
        wordLbl8.layer.cornerRadius = 8
        wordLbl9.layer.cornerRadius = 8
        wordLbl10.layer.cornerRadius = 8
        wordLbl11.layer.cornerRadius = 8
        wordLbl12.layer.cornerRadius = 8
        wordLbl13.layer.cornerRadius = 8
        wordLbl14.layer.cornerRadius = 8
        wordLbl15.layer.cornerRadius = 8
        wordLbl16.layer.cornerRadius = 8
        wordLbl17.layer.cornerRadius = 8
        wordLbl18.layer.cornerRadius = 8
        wordLbl19.layer.cornerRadius = 8
        wordLbl20.layer.cornerRadius = 8
        wordLbl21.layer.cornerRadius = 8
        wordLbl22.layer.cornerRadius = 8
        wordLbl23.layer.cornerRadius = 8
        wordLbl24.layer.cornerRadius = 8
        wordLbl25.layer.cornerRadius = 8
        wordLbl26.layer.cornerRadius = 8
        wordLbl27.layer.cornerRadius = 8
        wordLbl28.layer.cornerRadius = 8
        wordLbl29.layer.cornerRadius = 8
        wordLbl30.layer.cornerRadius = 8
        wordLbl31.layer.cornerRadius = 8
        wordLbl32.layer.cornerRadius = 8
        wordLbl33.layer.cornerRadius = 8
        wordLbl34.layer.cornerRadius = 8
        wordLbl35.layer.cornerRadius = 8
        wordLbl36.layer.cornerRadius = 8
        //
        wordLbl1.layer.masksToBounds = true
        wordLbl2.layer.masksToBounds = true
        wordLbl3.layer.masksToBounds = true
        wordLbl4.layer.masksToBounds = true
        wordLbl5.layer.masksToBounds = true
        wordLbl6.layer.masksToBounds = true
        wordLbl7.layer.masksToBounds = true
        wordLbl8.layer.masksToBounds = true
        wordLbl9.layer.masksToBounds = true
        wordLbl10.layer.masksToBounds = true
        wordLbl11.layer.masksToBounds = true
        wordLbl12.layer.masksToBounds = true
        wordLbl13.layer.masksToBounds = true
        wordLbl14.layer.masksToBounds = true
        wordLbl15.layer.masksToBounds = true
        wordLbl16.layer.masksToBounds = true
        wordLbl17.layer.masksToBounds = true
        wordLbl18.layer.masksToBounds = true
        wordLbl19.layer.masksToBounds = true
        wordLbl20.layer.masksToBounds = true
        wordLbl21.layer.masksToBounds = true
        wordLbl22.layer.masksToBounds = true
        wordLbl23.layer.masksToBounds = true
        wordLbl24.layer.masksToBounds = true
        wordLbl25.layer.masksToBounds = true
        wordLbl26.layer.masksToBounds = true
        wordLbl27.layer.masksToBounds = true
        wordLbl28.layer.masksToBounds = true
        wordLbl29.layer.masksToBounds = true
        wordLbl30.layer.masksToBounds = true
        wordLbl31.layer.masksToBounds = true
        wordLbl32.layer.masksToBounds = true
        wordLbl33.layer.masksToBounds = true
        wordLbl34.layer.masksToBounds = true
        wordLbl35.layer.masksToBounds = true
        wordLbl36.layer.masksToBounds = true
        
        //image
        one.isHidden = true
        two.isHidden = true
        three.isHidden = true
        
                
      if !isPlay {
          self.animating()
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
              self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(self.customTimeStep), target: self, selector: #selector(self.setRandomBackgroundColor), userInfo: nil, repeats: true)
              self.isPlay = true
              self.playpauseBtn.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
              self.TrainTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.trainTime), userInfo: nil, repeats: true)
          }
      }else{
          timer.invalidate()
          isPlay = false
          playpauseBtn.setImage(#imageLiteral(resourceName: "play"), for: .normal)
          TrainTimer.invalidate()
      }
        
        
    }
            
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
        TrainTimer.invalidate()
        
    }
            
    func animating(){
       UIView.animate(withDuration: 0.2,
          animations: {
           self.three.isHidden = false
            self.three.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
       }, completion: { _ in
           UIView.animate(withDuration: 0.2, animations: {
            self.three.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
           self.three.isHidden = true
       }, completion: {_ in
           UIView.animate(withDuration: 0.2,
              animations: {
                   self.two.isHidden = false
                self.two.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
              },
              completion: { _ in
               UIView.animate(withDuration: 0.2, animations: {
                   self.two.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
                   self.two.isHidden = true
                   }, completion: {_ in
                       UIView.animate(withDuration: 0.2,
                         animations: {
                          self.one.isHidden = false
                            self.one.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                         },
                         completion: { _ in
                             UIView.animate(withDuration: 0.2) {
                              self.one.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
                              self.one.isHidden = true
                          }
                      })
                   })
               })
           })
       })

    }
    
    
    //save setting
    func saveSetting(){
        
        let defaults = UserDefaults.standard
        defaults.set(Int(speedSlider.value * 100), forKey: "exercise3_level")
//        defaults.set(self.rowNumbers, forKey: "exercise4_row")
    //        defaults.setColor(color: customColor, forKey: "color")
       
        
    }

    
                    
    @IBAction func playpauseBtnPressed(_ sender: Any) {
        
        playpauseBtn.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

        UIView.animate(withDuration: 2.0, delay: 0,                  usingSpringWithDamping: CGFloat(0.20),initialSpringVelocity: CGFloat(6.0), options: UIView.AnimationOptions.allowUserInteraction, animations: {
            self.playpauseBtn.transform = CGAffineTransform.identity
            }, completion: { Void in()  }
        )
        
        
        if !isPlay {
            self.animating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.timer = Timer.scheduledTimer(timeInterval: TimeInterval(self.customTimeStep), target: self, selector: #selector(self.setRandomBackgroundColor), userInfo: nil, repeats: true)
                self.isPlay = true
                self.playpauseBtn.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
                self.TrainTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.trainTime), userInfo: nil, repeats: true)
            }
        }else{
            timer.invalidate()
            isPlay = false
            playpauseBtn.setImage(#imageLiteral(resourceName: "play"), for: .normal)
            TrainTimer.invalidate()
        }
        
    }

      
            
    @IBAction func speedSlider(_ sender: UISlider) {
        
        if timer.isValid == true {
            timer.invalidate()
            TrainTimer.invalidate()
        }
        
        customTimeStep = 1.0 - speedSlider.value
        if customTimeStep < 0.03{ customTimeStep = 0.04}
        timer = Timer.scheduledTimer(timeInterval: TimeInterval(customTimeStep), target: self, selector: #selector(setRandomBackgroundColor), userInfo: nil, repeats: true)
        isPlay = true
        playpauseBtn.setImage(#imageLiteral(resourceName: "pause"), for: .normal)
        TrainTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(trainTime), userInfo: nil, repeats: true)
           
        self.saveSetting()
               
    }
            
    @objc func trainTime(){
       TrainTime = TrainTime + 1
       let kMinute = filteredTime(num: Int(TrainTime/60))
       let kSecond = filteredTime(num: Int(TrainTime%60))
       self.timeLbl.text = kMinute + " : " + kSecond
    }

    func filteredTime(num: Int) -> String{
       var k : String = ""
       if String(num).count  == 1 {
           k = "0" + String(num)
       }else{
           k = String(num)
       }
       return k
    }
         

            
    @objc func setRandomBackgroundColor() {
        
        if internalCounter == 0 {
            //Input data
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl1.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl2.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl3.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl4.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl5.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl6.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl1.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl7.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl8.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl9.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl10.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl11.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl12.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl13.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl14.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl15.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl16.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl17.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl18.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl19.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl20.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl21.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl22.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl23.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl24.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl25.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl26.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl27.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl28.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl29.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl30.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl31.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl32.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl33.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl34.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl35.text = self.selectedExercises[self.counter]
            if counter == selectedExercises.count - 1 {self.counter = -1}
            self.counter = self.counter + 1
            self.wordLbl36.text = self.selectedExercises[self.counter]
                 
            //Coloring_Dynamic
                
            self.wordLbl1.backgroundColor = customColor
            self.wordLbl36.backgroundColor = .clear
            
            internalCounter = internalCounter + 1
        }else if internalCounter == 1 {
            self.wordLbl1.backgroundColor = .clear
            self.wordLbl2.backgroundColor = customColor
            
            internalCounter = internalCounter + 1
        }else if internalCounter == 2 {
            
            self.wordLbl2.backgroundColor = .clear
            self.wordLbl3.backgroundColor = customColor
            
            internalCounter = internalCounter + 1
        }else if internalCounter == 3{
            
            self.wordLbl3.backgroundColor = .clear
            self.wordLbl4.backgroundColor = customColor
           
            internalCounter = internalCounter + 1
        }else if internalCounter == 4 {
            
            self.wordLbl4.backgroundColor = .clear
            self.wordLbl5.backgroundColor = customColor
            
            internalCounter = internalCounter + 1
        }else if internalCounter == 5 {
            
            self.wordLbl5.backgroundColor = .clear
            self.wordLbl6.backgroundColor = customColor
            
            internalCounter = internalCounter + 1
        }else if internalCounter == 6 {
            
            self.wordLbl6.backgroundColor = .clear
            self.wordLbl7.backgroundColor = customColor
            
            internalCounter = internalCounter + 1
        }else if internalCounter == 7 {
            
            self.wordLbl7.backgroundColor = .clear
            self.wordLbl8.backgroundColor = customColor
            
            internalCounter = internalCounter + 1
        }else if internalCounter == 8 {
            
            self.wordLbl8.backgroundColor = .clear
            self.wordLbl9.backgroundColor = customColor
            
            internalCounter = internalCounter + 1
        }else if internalCounter == 9 {
            
            self.wordLbl9.backgroundColor = .clear
            self.wordLbl10.backgroundColor = customColor
           
            internalCounter = internalCounter + 1
        }else if internalCounter == 10 {
            
            self.wordLbl10.backgroundColor = .clear
            self.wordLbl11.backgroundColor = customColor
            
            internalCounter = internalCounter + 1
        }else if internalCounter == 11{
            
            self.wordLbl11.backgroundColor = .clear
            self.wordLbl12.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 12{
            
            self.wordLbl12.backgroundColor = .clear
            self.wordLbl13.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 13{
            
            self.wordLbl13.backgroundColor = .clear
            self.wordLbl14.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 14{
            
            self.wordLbl14.backgroundColor = .clear
            self.wordLbl15.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 15{
            
            self.wordLbl15.backgroundColor = .clear
            self.wordLbl16.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 16{
            
            self.wordLbl16.backgroundColor = .clear
            self.wordLbl17.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 17{
            
            self.wordLbl17.backgroundColor = .clear
            self.wordLbl18.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 18{
            
            self.wordLbl18.backgroundColor = .clear
            self.wordLbl19.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 19{
            
            self.wordLbl19.backgroundColor = .clear
            self.wordLbl20.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 20{
            
            self.wordLbl20.backgroundColor = .clear
            self.wordLbl21.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 21{
            
            self.wordLbl21.backgroundColor = .clear
            self.wordLbl22.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 22{
            
            self.wordLbl22.backgroundColor = .clear
            self.wordLbl23.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 23{
            
            self.wordLbl23.backgroundColor = .clear
            self.wordLbl24.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 24{
            
            self.wordLbl24.backgroundColor = .clear
            self.wordLbl25.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 25{
            
            self.wordLbl25.backgroundColor = .clear
            self.wordLbl26.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 26{
            
            self.wordLbl26.backgroundColor = .clear
            self.wordLbl27.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 27{
            
            self.wordLbl27.backgroundColor = .clear
            self.wordLbl28.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 28{
            
            self.wordLbl28.backgroundColor = .clear
            self.wordLbl29.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 29{
            
            self.wordLbl29.backgroundColor = .clear
            self.wordLbl30.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 30{
            
            self.wordLbl30.backgroundColor = .clear
            self.wordLbl31.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 31{
            
            self.wordLbl31.backgroundColor = .clear
            self.wordLbl32.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 32{
            
            self.wordLbl32.backgroundColor = .clear
            self.wordLbl33.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 33{
            
            self.wordLbl33.backgroundColor = .clear
            self.wordLbl34.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else if internalCounter == 34{
            
            self.wordLbl34.backgroundColor = .clear
            self.wordLbl35.backgroundColor = customColor
            internalCounter = internalCounter + 1
        }else {
            self.wordLbl35.backgroundColor = .clear
            self.wordLbl36.backgroundColor = customColor
            internalCounter = 0
        }
    }
            
    @IBAction func editBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "edit4", sender: self)
        
    }
    
}
