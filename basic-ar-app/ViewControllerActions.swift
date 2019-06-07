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
        let plane = SCNPlane(width: CGFloat(anchor.center.x), height: CGFloat(anchor.center.z))
        //        let grassImage = UIImage(named: "grass")
        let grassMaterial = SCNMaterial()
        //        grassMaterial.diffuse.contents = grassImage
        grassMaterial.isDoubleSided = true
        plane.materials = [grassMaterial]
        let planeNode = SCNNode(geometry: plane)
        planeNode.position = position
        planeNode.transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
        
        return planeNode
    }
    
    func createNode() {
        var wolfNode: SCNNode!
        if let wolfScene = SCNScene(named: currentNodeName) {
            wolfNode = wolfScene.rootNode.childNode(withName: "wolf", recursively: true)
            wolfNode.position = sceneView.scene.rootNode.childNodes.last!.position
            sceneView.scene.rootNode.childNodes.last?.removeFromParentNode()
            sceneView.scene.rootNode.addChildNode(wolfNode!)
        }
    }
    
    func restartView() {
        sceneView.scene.rootNode.enumerateChildNodes { (existingNode, _) in
            existingNode.removeFromParentNode()
        }
    }
    
}

