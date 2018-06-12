import UIKit
/**
 * Main view
 * NOTE: Merge videos: https://www.raywenderlich.com/188034/how-to-play-record-and-merge-videos-in-ios-and-swift
 * overlays on videos: https://www.lynda.com/Swift-tutorials/AVFoundation-Essentials-iOS-Swift/504183-2.html
 * backround audio support: https://github.com/Awalz/SwiftyCam
 * disable allowAutoRotate: https://github.com/Awalz/SwiftyCam/blob/master/Source/SwiftyCamViewController.swift
 */
class HybridCamView:UIView{
    lazy var camView:CamView = createCamView()
    lazy var topBar:TopBar = createTopBar()
    lazy var recordButton:RecordButton = createRecordButton()
    var onCameraExit:()->Void = {Swift.print("default onCameraExit")}
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = .green
        _ = camView
        _ = topBar
        _ = recordButton
        attachCallBacks()
        camView.startPreview()/*starts preview session*/    
    }
    /**
     * Boilerplate
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/**
 * Events
 */
extension HybridCamView{
    /**
     * Attach CallBacks
     */
    func attachCallBacks(){
        recordButton.onShortPressRelease = {
            self.camView.takePhoto()
        }
        recordButton.onLongPressBegan = {
            self.camView.startRecording()
        }
        recordButton.onLongPressRelease = {
             self.camView.stopRecording()
        }
        topBar.flipButton.onToggle = { toggle in
//            Swift.print("flipButton: \(toggle)")
            self.camView.setCamera(cameraType: toggle ? .front : .back)
        }
        topBar.flashButton.onToggle = { toggle in
//            Swift.print("flashButton: \(toggle)")
            self.camView.setFlashMode(flashMode:  toggle ? .on : .off)
        }
        topBar.exitButton.onClick = {
            self.onCameraExit()
        }
    }
}
extension HybridCamView{
    /**
     * New
     */
    func createCamView() -> CamView{
        let rect = CGRect.init(origin: .init(), size: UIScreen.main.bounds.size)
        let camView = CamView(frame: rect)/*TopLeft orientation*/
        self.addSubview(camView)
        return camView
    }
    /**
     * New
     */
    func createTopBar()->TopBar {
        let rect = CGRect.init(origin: .init(), size: CGSize.init(width: UIScreen.main.bounds.size.width, height: 120))
        let topBar = TopBar.init(frame: rect)
        self.addSubview(topBar)
        return topBar
    }
    /**
     * Creates Record button
     */
    func createRecordButton() -> RecordButton{
        let btn = RecordButton()
        self.addSubview(btn)
        btn.setPosition()
        return btn
    }
}
