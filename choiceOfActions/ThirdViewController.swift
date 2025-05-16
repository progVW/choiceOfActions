//
//  ThirdViewController.swift
//  choiceOfActions
//
//  Created by Sergey Sukharev on 15.05.2025.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var sliderRedOUT: UISlider!
    @IBOutlet weak var sliderGreenOUT: UISlider!
    @IBOutlet weak var sliderBlueOUT: UISlider!
    @IBOutlet weak var sliderAlphaOUT: UISlider!
    @IBOutlet weak var picture: UIView!
    @IBOutlet weak var labelValueRed: UILabel!
    @IBOutlet weak var labelValueGreen: UILabel!
    @IBOutlet weak var labelValueBlue: UILabel!
    @IBOutlet weak var labelValueAlpha: UILabel!
    

    
    let maxColorValue: Float = 255.0
    let minColorValue: Float = 0.0
    
    
    //нахождение медианы значения у слайдера
    func mediana(_ sender: inout UISlider) {
        sender.value = (sender.maximumValue - sender.minimumValue) / 2 + sender.minimumValue
    }
    
    
    //функция изменения значений у label слайдеров
    func printLabelValue() {
        labelValueRed.text = "\(Int(sliderRedOUT.value))"
        labelValueGreen.text = "\(Int(sliderGreenOUT.value))"
        labelValueBlue.text = "\(Int(sliderBlueOUT.value))"
        labelValueAlpha.text = "\(round(sliderAlphaOUT.value * 10) / 10)"
    }
    
    
    //функция для изменения цвета у UIView
    func changePictureBackgroundColor(R: CGFloat, G: CGFloat, B: CGFloat) {
        picture.backgroundColor = UIColor(
            red: R / CGFloat(maxColorValue),
            green: G / CGFloat(maxColorValue),
            blue: B / CGFloat(maxColorValue),
            alpha: CGFloat(sliderAlphaOUT.value))
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Third screen"
        
        setupBoundaryValue(for: sliderRedOUT)
        setupBoundaryValue(for: sliderBlueOUT)
        setupBoundaryValue(for: sliderGreenOUT)
        sliderAlphaOUT.minimumValue = 0
        sliderAlphaOUT.maximumValue = 1
        mediana(&sliderRedOUT)
        mediana(&sliderBlueOUT)
        mediana(&sliderGreenOUT)
        mediana(&sliderAlphaOUT)
        printLabelValue()
    }
    
    
    /*
     вспомогательная функция для инициализации
     начальных значений слайдеров
    */
    func setupBoundaryValue(for slider: UISlider) {
        slider.minimumValue = minColorValue
        slider.maximumValue = maxColorValue
    }
    
    
    //функция изменения слайдера красного цвета
    @IBAction func sliderRed(_ sender: UISlider) {
        labelValueRed.text = "\(Int(sender.value))"
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value),
            G: CGFloat(sliderGreenOUT.value),
            B: CGFloat(sliderBlueOUT.value))
    }
    
    
    //функция изменения слайдера зеленого цвета
    @IBAction func sliderGreen(_ sender: UISlider) {
        labelValueGreen.text = "\(Int(sender.value))"
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value),
            G: CGFloat(sliderGreenOUT.value),
            B: CGFloat(sliderBlueOUT.value))
    }
    
    //функция изменения слайдера синего цвета
    @IBAction func sliderBlue(_ sender: UISlider) {
        labelValueBlue.text = "\(Int(sender.value))"
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value),
            G: CGFloat(sliderGreenOUT.value),
            B: CGFloat(sliderBlueOUT.value))
    }
    
    
    /*
     Кнопка для установки значений
     sliderRED
     sliderGREEN
     sliderBlue
     в значение 0.0
    */
    @IBAction func minAction(_ sender: Any) {
        sliderRedOUT.value = minColorValue
        sliderGreenOUT.value = minColorValue
        sliderBlueOUT.value = minColorValue
        printLabelValue()
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value),
            G: CGFloat(sliderGreenOUT.value),
            B: CGFloat(sliderBlueOUT.value))
    }
    
    
    /*
     Кнопка для установки значений
     sliderRED
     sliderGREEN
     sliderBlue
     в значение 127.5
    */
    @IBAction func mediumAction(_ sender: Any) {
        mediana(&sliderRedOUT)
        mediana(&sliderBlueOUT)
        mediana(&sliderGreenOUT)
        printLabelValue()
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value),
            G: CGFloat(sliderGreenOUT.value),
            B: CGFloat(sliderBlueOUT.value))
    }
    
    
    /*
     Кнопка для установки значений
     sliderRED
     sliderGREEN
     sliderBlue
     в значение 255.0
    */
    @IBAction func maxAction(_ sender: Any) {
        sliderRedOUT.value = maxColorValue
        sliderGreenOUT.value = maxColorValue
        sliderBlueOUT.value = maxColorValue
        printLabelValue()
        changePictureBackgroundColor(
            R: CGFloat(sliderRedOUT.value),
            G: CGFloat(sliderGreenOUT.value),
            B: CGFloat(sliderBlueOUT.value))
    }
    
    
    //Функция для редактирования значения прозрачности
    @IBAction func sliderAlpha(_ sender: UISlider) {
        sender.value = sliderAlphaOUT.value
        changePictureBackgroundColor(
            R: CGFloat(self.sliderRedOUT.value),
            G: CGFloat(self.sliderGreenOUT.value),
            B: CGFloat(self.sliderBlueOUT.value))
        printLabelValue()
    }

    
    @IBAction func backToTheRootScreen(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
