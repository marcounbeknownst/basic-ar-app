//
//  Constants.swift
//  basic-ar-app
//
//  Created by Marco Vazquez on 6/7/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import Foundation

enum Constants {
    static let modelList = [Node](
        arrayLiteral:
        Node(location: "Models.scnassets/cube/cube.dae", name: "cube", icon: "cube"),
        Node(location: "Models.scnassets/fox/fox.dae", name: "fox", icon: "fox"),
        Node(location: "Models.scnassets/hatsune/hatsune.dae", name: "hatsune", icon: "hatsune"),
        Node(location: "Models.scnassets/orb/orb.dae", name: "orb", icon: "orb"),
        Node(location: "Models.scnassets/starwars/starwars.dae", name: "starwars", icon: "starwars"),
        Node(location: "Models.scnassets/tone/tone.dae", name: "tone", icon: "tone"),
        Node(location: "Models.scnassets/wolf/wolf.dae", name: "wolf", icon: "wolf")
    )
}
