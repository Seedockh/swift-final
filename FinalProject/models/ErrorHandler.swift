import Foundation

enum ErrorHandler: Error {
    case noError
    case registerInvalidCredentials
    case registerSuccessful
    case loginNotRegistered
    case loginInvalidCredentials
    case loginSuccessful
    case changePasswordInvalidPassword
    case changePasswordSameAsOld
    case changePasswordSuccessful
    case passwordTooShort
    case emailBadFormat
    
    func getErrorMessage() -> String {
        switch self {
        case .noError: return ""
        case .registerInvalidCredentials: return "Email or password invalid"
        case .registerSuccessful: return "Successful sign up"
            
        case .loginNotRegistered: return "Please register first"
        case .loginInvalidCredentials: return "Unable to find a match with this pair of email / password"
        case .loginSuccessful: return "Successful login"
            
        case .changePasswordInvalidPassword: return "Passwords are not matching"
        case .changePasswordSameAsOld: return "New password isn't really new, is it..."
        case .changePasswordSuccessful: return "Password change is a success"
            
        case .passwordTooShort: return "Password must be at least 6 character long"
        case .emailBadFormat: return "Email must be at least 6 characters long, and must match a correct mail adress."
        }
    }
}
