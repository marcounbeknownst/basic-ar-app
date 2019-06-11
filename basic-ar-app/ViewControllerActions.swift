//
//  ViewControllerActions.swift
//  basic-ar-app
//
//  Created by Marco Vazquez on 6/6/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import ARKit
import SceneKit

extension ViewController {
    
    func createPlane(anchor: ARPlaneAnchor) -> SCNNode {
        let position = SCNVector3Make(anchor.transform.columns.3.x, anchor.transform.columns.3.y, anchor.transform.columns.3.z)
        self.lastPosition = position
        let plane = SCNPlane(width: CGFloat(anchor.center.x + 0.1), height: CGFloat(anchor.center.z + 0.1))
        let image = UIImage(named: "material")
        let material = SCNMaterial()
        material.diffuse.contents = image
        material.isDoubleSided = true
        plane.materials = [material]
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = position
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
        
        return planeNode
    }
    
    func createNode() {
        var newNode: SCNNode!
        
        guard lastPosition != nil else {
            print("error = last position not found")
            showToast(message: "Plane not found")
            return
        }
        
        if let newScene = SCNScene(named: currentNode?.location ?? "Models.scnassets/cube/cube.dae") {
            newNode = newScene.rootNode.childNode(withName: currentNode?.name ?? "cube", recursively: true)
            newNode.position = lastPosition!
            sceneView.scene.rootNode.childNodes.last?.removeFromParentNode()
            sceneView.scene.rootNode.addChildNode(newNode!)
        }
    }
    
    func restartView() {
        sceneView.scene.rootNode.enumerateChildNodes { (existingNode, _) in
            existingNode.removeFromParentNode()
        }
    }
    
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-150, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}

