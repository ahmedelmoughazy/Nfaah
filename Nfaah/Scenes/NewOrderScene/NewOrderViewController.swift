//
//  NewOrderViewController.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/3/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import FirebaseAuth
import MapKit
import UIKit

class NewOrderViewController: BaseViewController<NewOrderPresenter> {
    
    // MARK: - Private Variables
    private var textViews = [FloatLabelTextView]()
    private let timePicker = UIDatePicker()
    private let imagePicker = UIImagePickerController()
    private let formatter = DateFormatter()
    private var image = UIImage()
    private var locationManager: CLLocationManager!
    private var userLocation: CLLocation?
    // MARK: - IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var userNameTextView: FloatLabelTextView!
    @IBOutlet private weak var numberTextView: FloatLabelTextView!
    @IBOutlet private weak var orderTypeTextView: DropDown!
    @IBOutlet private weak var shopNameTextView: FloatLabelTextView!
    @IBOutlet private weak var shopAddressTextView: FloatLabelTextView!
    @IBOutlet private weak var orderTextView: FloatLabelTextView!
    @IBOutlet private weak var timeTextField: UITextField!
    @IBOutlet private weak var imageLabel: UILabel!
    @IBOutlet private weak var slectedImageView: UIImageView!
    @IBOutlet private weak var orderTextViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var shopNameViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var shopAddressViewHeight: NSLayoutConstraint!
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var submitOrderButton: UIButton!
    
    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setupTimePicker()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        determineCurrentLocation()
    }
}

// MARK: - IBActions
extension NewOrderViewController {
    @IBAction func closeAction(_ sender: UIButton) {
        presenter.dismissView()
    }
    
    @IBAction func submitAction(_ sender: UIButton) {
        let allHaveText = textViews.allSatisfy { $0.text?.isEmpty == false }
        if allHaveText {
            // presenter fill order and make request
            let order = Order(date: timePicker.date,
                              latitude: userLocation?.coordinate.latitude,
                              longitude: userLocation?.coordinate.longitude,
                              name: userNameTextView.text,
                              order: "\(String(describing: orderTextView.text)) , \(String(describing: shopNameTextView.text)) , \(String(describing: shopAddressTextView.text))",
                              orderId: "\(Date().timeIntervalSince1970)",
                              orderNum: "0",
                              phone: numberTextView.text,
                              status: L10n.NewOrder.Screen.Order.pending)
            presenter.add(order: order)
        } else {
            showErrorMassege(errorMessage: L10n.Sign.Screen.emptyFields)
        }
    }
}

// MARK: - Selectors
extension NewOrderViewController {
    @objc
    func startTimeDiveChanged(sender: UIDatePicker) {
        timeTextField.text = formatter.string(from: sender.date)
    }
    
    @objc
    func doneDatePickerPressed(){
        timeTextField.text = formatter.string(from: timePicker.date)
        self.view.endEditing(true)
    }
    
    @objc
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
}

// MARK: - Private
extension NewOrderViewController {
    private func setupTimePicker()  {
        formatter.timeStyle = .short
        
        timePicker.datePickerMode = .time
        timePicker.frame = CGRect(x: 0.0, y: (self.view.frame.height/2 + 60), width: self.view.frame.width, height: 150.0)
        timePicker.backgroundColor = UIColor.white
        timePicker.addTarget(self, action: #selector(startTimeDiveChanged), for: .valueChanged)
        
        timeTextField.inputView = timePicker
        
        // datepicker toolbar setup
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: L10n.NewOrder.Screen.done,
                                         style: .done,
                                         target: self,
                                         action: #selector(doneDatePickerPressed))
        
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        timeTextField.inputAccessoryView = toolBar
    }
    
    private func setUpView() {
        titleLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        titleLabel.text = L10n.Order.Screen.newOrder
        
        timeTextField.font = FontFamily._29LTAzer.medium.font(size: 20)
        timeTextField.textColor = Asset.Colors.bahamaBlue.color
        timeTextField.placeholder = L10n.NewOrder.Screen.deliveryTime
        timeTextField.tintColor = .clear
        timeTextField.delegate = self
        
        imageLabel.font = FontFamily._29LTAzer.medium.font(size: 20)
        imageLabel.text = L10n.NewOrder.Screen.chooseImage
        imageLabel.textColor = UIColor.lightGray.withAlphaComponent(0.65)
        
        setUp(textField: userNameTextView, with: L10n.NewOrder.Screen.name)
        setUp(textField: numberTextView, with: L10n.NewOrder.Screen.mobile)
        setUp(textField: shopNameTextView, with: L10n.NewOrder.Screen.placeName)
        setUp(textField: shopAddressTextView, with: L10n.NewOrder.Screen.placeAddress)
        setUp(textField: orderTextView, with: L10n.NewOrder.Screen.yourOrder)
        
        orderTypeTextView.font = FontFamily._29LTAzer.medium.font(size: 20)
        orderTypeTextView.text = L10n.NewOrder.Screen.orderPlace
        orderTypeTextView.textColor = UIColor.lightGray.withAlphaComponent(0.65)
        orderTypeTextView.selectedRowColor = UIColor.lightGray.withAlphaComponent(0.65)
        orderTypeTextView.optionArray = ["Option 1", "Option 2", "Option 3"]
        orderTypeTextView.didSelect{(selectedText , index ,id) in
            self.orderTypeTextView.textColor = Asset.Colors.bahamaBlue.color
            self.orderTypeTextView.text = selectedText
        }
        
        shopNameTextView.textContainer.heightTracksTextView = true
        shopNameTextView.isScrollEnabled = false
        
        shopAddressTextView.textContainer.heightTracksTextView = true
        shopAddressTextView.isScrollEnabled = false
        
        orderTextView.textContainer.heightTracksTextView = true
        orderTextView.isScrollEnabled = false
        
        userNameTextView.text = Auth.auth().currentUser?.displayName
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(imageTapped(tapGestureRecognizer:)))
        slectedImageView.isUserInteractionEnabled = true
        slectedImageView.addGestureRecognizer(tapGestureRecognizer)
        
        submitOrderButton.layer.modifyCornerRadius(radius: submitOrderButton.frame.height / 3.5 )
        submitOrderButton.setTitle(L10n.NewOrder.Screen.submit, for: .normal)
        submitOrderButton.titleLabel?.font = FontFamily._29LTAzer.medium.font(size: 16)
        
        textViews.append(userNameTextView)
        textViews.append(numberTextView)
        textViews.append(shopNameTextView)
        textViews.append(shopAddressTextView)
        textViews.append(orderTextView)
    }
    
    private func setUp(textField: FloatLabelTextView, with text: String) {
        textField.titleFont = FontFamily._29LTAzer.medium.font(size: 16)
        textField.titleActiveTextColour = .black
        textField.font = FontFamily._29LTAzer.medium.font(size: 20)
        textField.textColor = Asset.Colors.bahamaBlue.color
        textField.hintFont = FontFamily._29LTAzer.medium.font(size: 20)
        textField.hint = text
        textField.delegate = self
    }
    
    private func determineCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            //locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
    }
}

// MARK: - Protocal
extension NewOrderViewController: NewOrderViewProtocol {
    
}

// MARK: - TextView Delegate
extension NewOrderViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
        let numberOfChars = newText.count
        switch textView {
        case userNameTextView:
            return numberOfChars < 35
        case numberTextView:
            return numberOfChars <= 11
        default:
            return true
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView == orderTextView {
            
            if orderTextViewHeight != nil { orderTextViewHeight.isActive = false }
            let constraintHeight = orderTextView.heightAnchor.constraint(equalToConstant: 50)
            constraintHeight.priority = UILayoutPriority(rawValue: 250)
            constraintHeight.isActive = true
            
        } else if textView == shopNameTextView {
            
            if shopNameViewHeight != nil { shopNameViewHeight.isActive = false }
            let constraintHeight = shopNameTextView.heightAnchor.constraint(equalToConstant: 50)
            constraintHeight.priority = UILayoutPriority(rawValue: 250)
            constraintHeight.isActive = true
            
        } else if textView == shopAddressTextView {
            
            if shopAddressViewHeight != nil { shopAddressViewHeight.isActive = false }
            let constraintHeight = shopAddressTextView.heightAnchor.constraint(equalToConstant: 50)
            constraintHeight.priority = UILayoutPriority(rawValue: 250)
            constraintHeight.isActive = true
            
        }
    }
}

// MARK: - UITextField Delegate
extension NewOrderViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}

// MARK: - UIImagePicker Delegate
extension NewOrderViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = image
            self.slectedImageView.image = image
            imageLabel.textColor = Asset.Colors.bahamaBlue.color
            imageLabel.text = L10n.NewOrder.Screen.imageChoosen
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - MKMapView Delegate
extension NewOrderViewController: MKMapViewDelegate, CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        self.userLocation = userLocation
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        manager.stopUpdatingLocation()
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(region, animated: true)
        
        // Drop a pin at user's Current Location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
        //        myAnnotation.title = "Current location"
        mapView.addAnnotation(myAnnotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error \(error)")
    }
}
