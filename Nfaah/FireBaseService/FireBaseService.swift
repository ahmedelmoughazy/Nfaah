//
//  FireBaseService.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/4/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import Firebase
import FirebaseStorage

class FireBaseService {
    
    static let shared = FireBaseService()
    
    let databaseReference = Database.database().reference()
    let storageRef = Storage.storage().reference()
    
    func signIn(with user: User, completion: @escaping (Result<Void, Error>) -> Void) {
        checkIfUserExists { completion($0) }
    }
    
    func addToDataBase(user: User, completion: @escaping (Bool) -> Void) {
        let userDataDictionary = user.toDict()
        checkIfUserExists { [weak self] result in
            switch result {
            case .success:
                self?.databaseReference.child("Users").child(user.uid ?? "").setValue(userDataDictionary) { error, ref in
                    if error != nil {
                        completion(false)
                    } else {
                        completion(true)
                    }
                }
            case .failure:
                completion(false)
            }
        }
    }
    
    func addToDataBase(order: Order, completion: @escaping (Bool) -> Void) {
        let orderDictionary = order.toDict()
        databaseReference.child("Orders").child(order.orderId ?? "").setValue(orderDictionary) { error, ref in
            if error == nil {
                completion(true)
            } else {
                completion(false)
            }
        }
        addOrderToCurrentuser(order: order)
    }
    
    func addOrderToCurrentuser(order: Order) {
        let orderDictionary = order.toDict()
        databaseReference.child("Users")
            .child(Auth.auth().currentUser?.uid ?? "")
            .child("Orders")
            .child(order.orderId ?? "")
            .setValue(orderDictionary)
    }
    
    func getOrders(completion: @escaping (Swift.Result<[Order], Error>) -> Void) {
        var orders = [Order]()
        databaseReference.child("Users")
            .child(Auth.auth().currentUser?.uid ?? "")
            .child("Orders")
            .queryOrderedByKey()
            .observeSingleEvent(of: .value, with: { snapshot in
                
                
                for child in snapshot.children {
                    let snap = child as? DataSnapshot
                    let orderSnap = snap?.value as? [String: Any]
                    
                    let chosenTime = orderSnap?["chosenTime"] as? String
                    let date = orderSnap?["date"] as? String
                    let from = orderSnap?["from"] as? String
                    let latitude = orderSnap?["latitude"] as? Double
                    let longitude = orderSnap?["longitude"] as? Double
                    let name = orderSnap?["name"] as? String
                    let order = orderSnap?["order"] as? String
                    let orderId = orderSnap?["orderId"] as? String
                    let orderNum = orderSnap?["orderNum"] as? String
                    let phone = orderSnap?["phone"] as? String
                    let shopAddress = orderSnap?["shopAddress"] as? String
                    let shopName = orderSnap?["shopName"] as? String
                    let status = orderSnap?["status"] as? String
                    let uid = orderSnap?["uid"] as? String
                    
                    orders.append(Order(chosenTime: chosenTime,
                                        date: date,
                                        from: from,
                                        latitude: latitude,
                                        longitude: longitude,
                                        name: name,
                                        order: order,
                                        orderId: orderId,
                                        orderNum: orderNum,
                                        phone: phone,
                                        shopAddress: shopAddress,
                                        shopName: shopName,
                                        status: status,
                                        uid: uid))
                }
                
                completion(.success(orders))
                
            }) { (error) in
                completion(.failure(error))
        }
    }
    
    func uploadImage(data: Data, name: String) {
        
        let filePath = "Orders/\(name)"
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        self.storageRef.child(filePath).putData(data, metadata: metaData) { (metaData, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            } else {
            }
        }
        
    }
    
    private func checkIfUserExists(completion: @escaping (Result<Void, Error>) -> Void) {
        databaseReference.child("Users")
            .child(Auth.auth().currentUser?.uid ?? "")
            .observeSingleEvent(of: .value,
                                with: { snapshot in
                completion(.success)
            }) { error in
                completion(.failure(error))
            }
    }
}



