//
//  ViewController.swift
//  SeeMoreLabel
//
//  Created by Bhavin Bhadani on 22/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var seeMoreLabel: ReadMoreLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text1 = """
👨‍👩‍👧‍👦👨‍👩‍👧‍👦👨‍👩‍👧‍👦👨‍👩‍👧‍👦 Lorem http://ipsum.com dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
"""
        
        let text2 = """
A
B
C
D Lorem http://ipsum.com dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
"""
        
        let text3 = """
回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません
"""
        
        let text4 = """
回
答
は
2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません。回答は2000文字までです。それ以上は記入できません
"""
        
        let text5 = """
Lorem http://ipsum.com dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
"""
        
        let text6 = "N\nA\nt\nU\nr\ne"
        
        let text7 = "回\n答\nは\n文\n字までです"

        seeMoreLabel.text = text6
        seeMoreLabel.numberOfLines = 2
        seeMoreLabel.addTrailingText(
            textToAppend: "See More",
            fontOfTextToAppend: seeMoreLabel.font,
            colorOfTextToAppend: .black
        )
        seeMoreLabel.didTapReadMore = { [unowned self] in
            self.seeMoreLabel.numberOfLines = 0
        }
    }


}


public final class ReadMoreLabel: UILabel {
    
    override public var text: String? {
        willSet(newValue) {
            self.originalText = newValue
        }
    }
    
    private var originalText:String?
    private var trailingText = "See More" //"もっと見る"
    var didTapReadMore: (() -> Void)?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(tap:)))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    
    public func addTrailingText(
        trailingText: String = "...",
        textToAppend: String,
        fontOfTextToAppend: UIFont,
        colorOfTextToAppend: UIColor
    ) {
        let readMoreText = trailingText + textToAppend
        // dont do anything if its frame is not set
        guard self.frame != CGRect.zero, self.text?.isEmpty == false else{
            return
        }
        self.trailingText = textToAppend
        self.originalText = self.text
        let errorPadding = 4
        // first get the string that can be displayed in the required number of lines
        guard self.numberOfLines != 0,
              let lengthForVisibleString = self.visibleTextLength(),
              let unwrappedText = self.text, (lengthForVisibleString < unwrappedText.count),
              (lengthForVisibleString < unwrappedText.count), unwrappedText.count > (readMoreText.utf16.count + errorPadding)
        else {
            return
        }
        
        var startIndex = unwrappedText.index(unwrappedText.startIndex, offsetBy: lengthForVisibleString)
        var range = startIndex..<unwrappedText.endIndex
        // string without read more text that can be displayed
        let strTrimmedWithoutReadMore = unwrappedText.replacingCharacters(in: range, with: "")
        var startIndexOffset = strTrimmedWithoutReadMore.count - readMoreText.utf16.count - errorPadding
        if startIndexOffset < 0 {
            startIndexOffset = 0
        }
        startIndex = unwrappedText.index(unwrappedText.startIndex, offsetBy: startIndexOffset)
        let endIndex = unwrappedText.index(startIndex, offsetBy: readMoreText.utf16.count + errorPadding)
        range = startIndex..<endIndex
        
        var strTrimmedWithReadMode = strTrimmedWithoutReadMore

        // Check if the range is within the bounds of the string
        if startIndex >= strTrimmedWithoutReadMore.startIndex && endIndex <= strTrimmedWithoutReadMore.endIndex {
            strTrimmedWithReadMode = strTrimmedWithoutReadMore.replacingCharacters(in: range, with: "") + "..."
        } else {
            strTrimmedWithReadMode += "..."
        }
        let answerAttributed = NSMutableAttributedString(string: strTrimmedWithReadMode, attributes: [.font: self.font!])
        
        // string with characters trimmed for read more string
        let attributes: [NSAttributedString.Key: Any] = [
            .font: self.font!,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        // add read more attribtuted string
        let readMoreAttributed = NSMutableAttributedString(string: textToAppend, attributes: attributes)
        answerAttributed.append(readMoreAttributed)
        self.attributedText = answerAttributed
        addTapGesture()
    }
    
    @objc func handleTap(tap: UITapGestureRecognizer) {
        guard let unwrappedText = self.text, let range = unwrappedText.range(of: self.trailingText) else{
            return
        }
        let nsRange = NSRange(location: range.lowerBound.utf16Offset(in: unwrappedText), length: range.upperBound.utf16Offset(in: unwrappedText) - range.lowerBound.utf16Offset(in: unwrappedText))
        guard self.didTapAttributedText(locationFromTapGesture: tap.location(in: self), range: nsRange) else{
            return
        }
        self.text = originalText
        self.didTapReadMore?()
    }
    
    // returns the last index of the string that can be added
    private func visibleTextLength() -> Int? {
        guard let unwrappedText = self.text, let unwrappedFont = self.font, unwrappedText.isEmpty == false else {
            return nil
        }

        let lineBreakMode = NSLineBreakMode.byTruncatingTail
        let width = self.frame.size.width

        // Determine the target size as in how much can fit
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)

        let attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: unwrappedFont]
        let attributedText = NSAttributedString(string: unwrappedText, attributes: attributes)

        let boundingRect = attributedText.boundingRect(with: size, options: .usesLineFragmentOrigin, context: nil)

        // Compute the number of lines based on the target size
        let totalNumberOfLines = Int(ceil(boundingRect.height / font.lineHeight))
        guard totalNumberOfLines > self.numberOfLines else {
            return unwrappedText.utf16.count
        }

        var index = unwrappedText.unicodeScalars.startIndex
        var prev = unwrappedText.unicodeScalars.startIndex
        _ = CharacterSet.whitespacesAndNewlines
        let endIndex = unwrappedText.unicodeScalars.endIndex
        // Iterate through the string and for each word check if it can be added to the required size of the string or not
        repeat {
            prev = index

            let unwrappedIndex = index

            let startIndex = unwrappedText.unicodeScalars.index(after: unwrappedIndex)
            _ = startIndex..<unwrappedText.unicodeScalars.endIndex

            if lineBreakMode == NSLineBreakMode.byCharWrapping {
                index = unwrappedText.index(after: unwrappedIndex)
            } else {
                index = unwrappedText.unicodeScalars.index(after: unwrappedIndex)
            }

        } while (isHeightGreaterThanLabelHeight(indexOne: index, indexTwo: endIndex, text: unwrappedText, targetSize: size, attributes: attributes))

        return prev.utf16Offset(in: unwrappedText)
    }

    private func isHeightGreaterThanLabelHeight(indexOne: String.Index?, indexTwo: String.Index?, text: String, targetSize: CGSize, attributes: [NSAttributedString.Key: Any]) -> Bool {
        guard let unwrappedIndexOne = indexOne, let unwrappedIndexTwo = indexTwo else {
            return false
        }

        guard unwrappedIndexOne.utf16Offset(in: text) < unwrappedIndexTwo.utf16Offset(in: text) else {
            return false
        }

        let substring = String(text[...unwrappedIndexOne])
        let boundingRect = substring.boundingRect(with: targetSize, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)

        let totalNumberOfLines = Int(ceil(boundingRect.size.height / font.lineHeight))
        return totalNumberOfLines <= self.numberOfLines
    }
    
    private func didTapAttributedText(locationFromTapGesture: CGPoint, range: NSRange) -> Bool {
        guard let attributedText = self.attributedText else {
            return false
        }

        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize(width: bounds.width, height: .greatestFiniteMagnitude))
        let textStorage = NSTextStorage(attributedString: attributedText)

        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        textContainer.lineFragmentPadding = 0
        textContainer.lineBreakMode = .byWordWrapping
        textContainer.maximumNumberOfLines = numberOfLines

        let numberOfGlyphs = layoutManager.numberOfGlyphs
        var glyphRange = NSRange()

        for index in 0..<numberOfGlyphs {
            layoutManager.lineFragmentRect(forGlyphAt: index, effectiveRange: &glyphRange)
            let characterRange = layoutManager.characterRange(forGlyphRange: glyphRange, actualGlyphRange: nil)

            if NSIntersectionRange(characterRange, range).length > 0 {
                let location = layoutManager.location(forGlyphAt: index)
                let boundingRect = layoutManager.boundingRect(forGlyphRange: glyphRange, in: textContainer)
                let adjustedRect = boundingRect.offsetBy(dx: 0, dy: location.y-8)

                if adjustedRect.contains(locationFromTapGesture) {
                    return true
                }
            }
        }

        return false
    }

}
