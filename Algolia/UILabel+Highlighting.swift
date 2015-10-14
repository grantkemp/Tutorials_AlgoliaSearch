
//

import UIKit

extension UILabel {
    var highlightedText: String {
        get {
            return attributedText!.string
        }
        set {
            attributedTextFromHtml(newValue)
        }
    }
    
    private func attributedTextFromHtml(htmlText: String) {
        var text = NSMutableString(string: htmlText)
        var rangesOfAttributes = getRangeToHighlight(text)
        
        let attributedString = NSMutableAttributedString(string: String(text))
        for range in rangesOfAttributes {
            let color = highlightedTextColor ?? UIColor.yellowColor()
            attributedString.addAttribute(NSBackgroundColorAttributeName, value: color, range: range)
        }
        
        attributedText = attributedString
    }
    
    private func getRangeToHighlight(text: NSMutableString) -> [NSRange] {
        var rangesOfAttributes = [NSRange]()
        
        while true {
            let matchBegin = text.rangeOfString("<em>", options: .CaseInsensitiveSearch)
            
            if matchBegin.location != NSNotFound {
                text.deleteCharactersInRange(matchBegin)
                let firstCharacter = matchBegin.location
                
                let range = NSRange(location: firstCharacter, length: text.length - firstCharacter)
                let matchEnd = text.rangeOfString("</em>", options: .CaseInsensitiveSearch, range: range)
                if matchEnd.location != NSNotFound {
                    text.deleteCharactersInRange(matchEnd)
                    let lastCharacter = matchEnd.location
                    
                    rangesOfAttributes.append(NSRange(location: firstCharacter, length: lastCharacter - firstCharacter))
                }
            } else {
                break
            }
        }
        
        return rangesOfAttributes
    }
}

