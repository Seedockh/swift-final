import Foundation

class RegisterUser {
    static let instance: RegisterUser = RegisterUser()
    var user: User?
    
    func register(user: User?){
        self.user = user
    }
}
/*
print(RegisterUser.instance.email)
RegisterUser.instance.register(email: "john@jack.fr", password: "john")
 */
