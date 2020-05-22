//
//  TestNSCTagReader.swift
//  NFCReader
//
//  Created by JohnConnor on 2020/5/21.
//  Copyright © 2020 JohnConnor. All rights reserved.
//

import UIKit
import CoreNFC
class TestNSCTagReader: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func prepareScan()  {
        let readerSession = NFCTagReaderSession(pollingOption: NFCTagReaderSession.PollingOption.iso14443, delegate: self)
        
        readerSession?.alertMessage = "prepare to scan , hold your iPhone near the iso14443 "
        readerSession?.begin()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension TestNSCTagReader : NFCTagReaderSessionDelegate{
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        print("active")
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        print("did invalidate with error    ")
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        print("did detect tags")
        if tags.first?.isAvailable ?? false {
            
        }
        if case let NFCTag.iso7816(tag) = tags.first! {
            session.connect(to:  NFCTag.iso7816(tag)) { (error) in
                if error == nil {//connect successfully
                    let myAPDU = NFCISO7816APDU(instructionClass: 0, instructionCode: 0xb0, p1Parameter: 0, p2Parameter: 0, data: Data(), expectedResponseLength: 16)
                    tag.sendCommand(apdu: myAPDU) { (data, sw1, sw2, error) in
                        guard error != nil && !(sw1 == 0x90 && sw2 == 0) else {
                            session.invalidate(errorMessage: "application failure")
                            return
                        }
                    }
                }
            }
        }
        
    }
    
    
}
