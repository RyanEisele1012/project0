import UIKit

class ViewController: UIViewController {

    // Outlets for the text fields
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolTextField: UITextField!
    
    // Outlets for the labels
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    // Outlet for the segmented control (academic year)
    @IBOutlet weak var academicYearSegmentedControl: UISegmentedControl!
    
    // Outlet for the switch (wants more pets)
    @IBOutlet weak var wantsMorePetsSwitch: UISwitch!
    
    // Outlet for the stepper (number of pets)
    @IBOutlet weak var numberOfPetsStepper: UIStepper!
    
    // Outlet for the button (generate introduction)
    @IBOutlet weak var introduceButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the initial text for the labels
        firstNameLabel.text = "First"
        lastNameLabel.text = "Last"
        schoolLabel.text = "School"
        
        // Set initial values for the other UI elements
        numberOfPetsLabel.text = "0"
        academicYearSegmentedControl.selectedSegmentIndex = 0
        wantsMorePetsSwitch.isOn = false
        numberOfPetsStepper.value = 0
    }
    
    // Action for the stepper to update the number of pets label
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPetsLabel.text = Int(sender.value).description
    }
    
    // Action for the button to generate the introduction
    @IBAction func introduceSelf(_ sender: UIButton) {
        // Gather the input data
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let school = schoolTextField.text ?? ""
        let year = academicYearSegmentedControl.titleForSegment(at: academicYearSegmentedControl.selectedSegmentIndex) ?? ""
        let numberOfPets = numberOfPetsLabel.text ?? "0"
        let wantsMorePets = wantsMorePetsSwitch.isOn ? "Yes" : "No"
        
        // Create the introduction message
        let introduction = "Hello! My name is \(firstName) \(lastName) and I attend \(school). I am currently in my \(year) year and I have \(numberOfPets) pets. It is \(wantsMorePets) that I want more pets."
        
        // Display the introduction message
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}
