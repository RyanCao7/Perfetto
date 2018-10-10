import UIKit

class MargheritaViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var modalImage: UIImageView!
    
    @IBOutlet weak var pizzaName: UILabel!
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    @IBOutlet weak var pizzaDescription: UILabel!
    
    @IBOutlet weak var scrollView: UIPickerView!
    
    @IBOutlet weak var timesTenLabel: UILabel!
    
    let choices = [["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]]
    
    // Grabs the number of components (i.e. columns to choose from) for the UIPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return choices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return choices[component].count
    }

    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int ) -> String? {
        return choices[component][row]
    }
    
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Row: \(row), Component: \(component)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        scrollView.dataSource = self
        
        ingredientsLabel.text = "\u{2022} Buffalo Mozzarella \n\u{2022} Tomato Sauce \n\u{2022} Fresh Basil"
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func endEditing() {
        view.endEditing(true)
    }
}

//extension MargheritaViewController: UITextFieldDelegate {
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        endEditing()
//        return true
//    }
//}
