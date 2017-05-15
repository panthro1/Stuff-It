//
//  qrProtocol.swift
//  Stuff-It
//
//  Created by Michael King on 5/12/17.
//  Copyright © 2017 Microideas. All rights reserved.
//

import Foundation
import Firebase


protocol qrDelegate {
    typealias objectTypeReturned = qrScanTypes
    func getDataFromFirebase(qrScan: String, callback: @escaping (_ key: String?, _ objectTypeReturned: objectTypeReturned) -> Void)
}

    extension qrDelegate {
        typealias qrType = qrScanTypes
        
        func getDataFromFirebase(qrScan: String, callback: @escaping (_ key: String?, _ objectTypeReturned: qrType) -> Void) {
            var objectTypeReturned: qrType = .Error
            
            var objectKey: String!
            
            
            
            print("firebaseGo is ticking")
            
            let REF_QUERY_i = DataService.ds.REF_INVENTORY.child("items").queryOrdered(byChild: "itemQR").queryEqual(toValue: qrScan)
            
            let REF_QUERY_b = DataService.ds.REF_INVENTORY.child("boxes").queryOrdered(byChild: "boxQR").queryEqual(toValue: qrScan)
            
            REF_QUERY_i.observeSingleEvent(of: .value, with: { itemSnapshot in
                //                )(.value, with: { snapshot in
                if itemSnapshot.value is NSNull {
                     print("item Snap is NSNull ")
                    
                } else {
                    objectTypeReturned = .ItemSearch
                    let child: FIRDataSnapshot = itemSnapshot.children.nextObject() as! FIRDataSnapshot
                    objectKey = child.key
                    print("key is a item \(objectKey)")
                    
                }
                
                REF_QUERY_b.observeSingleEvent(of: .value, with: { boxSnapshot in
                    if boxSnapshot.value is NSNull {
                         print("box Snap is NSNull ")
                        
                    } else {
                        objectTypeReturned = .BoxSearch
                        let child: FIRDataSnapshot = boxSnapshot.children.nextObject() as! FIRDataSnapshot
                        objectKey = child.key
                        print("key is a Box \(objectKey)")
                    }
                    callback(objectKey, objectTypeReturned)
                })
            })
}


}
