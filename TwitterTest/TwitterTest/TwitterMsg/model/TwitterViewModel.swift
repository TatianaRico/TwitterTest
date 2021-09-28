//
//  TwitterController.swift
//  TwitterTest
//
//  Created by Tatiana Rico on 24/09/21.
//  Copyright © 2021 Tatiana Rico. All rights reserved.
//

import Foundation

class TwitterViewModel {
    //MARK: - Atributtes
    let request = Request()
    var modelUser: UserTwitter?
    var idUser: MsgIdTwitter?
    var msg: MsgTwitter?
    var idTwitter: TwitterModel?

    //MARK: request functions
    public func getRequestUserTwitter(name: String, completion: @escaping (Bool, UserTwitter?) -> Void) {
        request.requestUserTwitter(username: name){ (model, sucess) in
            if sucess {
                self.modelUser = model
                completion(true, model)
            } else{
                completion(false, nil)
            }
        }
    }
    
    public func getIdUserTwitter(id: String, completion: @escaping (Bool) -> Void) {
        request.requestIdTwitter(id: id) { (model, sucess) in
            if sucess {
                self.idUser = model
                completion(true)
            }
        }
    }
    
    //MARK: - Configure Cell
    public func numberOfRows() -> Int {
        return idUser?.data?.count ?? 0
    }
    
    public func cellForItem(indexPath: IndexPath) -> MsgTwitter {
        return idUser?.data?[indexPath.row] ?? MsgTwitter(id: "", text: "")
    }
}
