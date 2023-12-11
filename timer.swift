import Foundation

class Timer {
    static func runTimer(seconds: Int) {
        for second in (0...seconds).reversed() {
            print("Temps restant : \(second) secondes", terminator: "\r")
            sleep(1)
        }
        print("\n")
    }
}