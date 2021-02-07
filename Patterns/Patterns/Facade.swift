//
//  Facade.swift
//  Patterns
//
//  Created by Maxim V. Sidorov on 2/7/21.
//

import Foundation

final class Machine {
    enum State {
        case notRunning
        case ready
        case running
    }

    private(set) var state: State = .ready

    func startMachine() {
        print("Process starting...")
        state = .ready
        state = .running
        print("Machine is running")
    }

    func stopMachine() {
        print("Process is finishing")
        state = .notRunning
        print("Machine stopped")
    }
}


final class RequestManager {
    var isConnected: Bool = false

    func connectToTerminal() {
        print("Connecting to terminal...")
        isConnected = true
    }

    func disconnectToTerminal() {
        print("Disconnecting to terminal...")
        isConnected = false
    }

    func getStatusRequest(for machine: Machine) -> Machine.State {
        print("Sending status request...")
        return machine.state
    }

    func sendStartRequest(for machine: Machine) {
        print("Sending request to start the machine...")
        machine.startMachine()
    }

    func sendStopRequest(for machine: Machine) {
        print("Sending request to stop the machine...")
        machine.stopMachine()
    }
}

protocol Facade {
    func startMachine()
}

final class ConcreteFacade: Facade {
    func startMachine() {
        let machine = Machine()
        let manager = RequestManager()

        if !manager.isConnected {
            manager.connectToTerminal()
        }

        if manager.getStatusRequest(for: machine) == .ready {
            print("Machine is ready")
            manager.sendStartRequest(for: machine)
        }
    }
}
