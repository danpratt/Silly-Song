//
//  ViewController.swift
//  Silly Song
//
//  Created by Daniel Pratt on 1/19/17.
//  Copyright © 2017 Daniel Pratt. All rights reserved.
//

import UIKit

// Template for lyrics
let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: Any) {
        if nameField.text != "" {
            let lyrics = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
            lyricsView.text = lyrics
        }
        
    }

}

func shortNameFromName(name: String) -> String {
    let vowels = "aàeéêiöouúüũ"
    var shortName = name.lowercased()
    
    for character in shortName.characters {
        if vowels.contains(String(character).lowercased()) {
            return shortName
        } else {
            shortName.remove(at: shortName.startIndex)
        }
    }
    return shortName
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameFromName(name: fullName)
    let lyrics = lyricsTemplate
        .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
        .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}
