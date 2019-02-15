import Foundation

class RegisterUser {
    static let instance: RegisterUser = RegisterUser()
    var user: User?
    
    func register(user: User?){
        self.user = user
    }
}

