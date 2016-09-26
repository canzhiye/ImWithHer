import SafariServices

@available(iOS 9.0, *)
public class ImWithHer: NSObject {
	
	static let FirstOpenDate = "FirstOpenDate"
	static let UseCount = "UseCount"
	
	public static var daysUntilPrompt = 0 {
		didSet {
			
		}
	}
	
	public static var usesUntilPrompt = 0 {
		didSet {
			
		}
	}
	
	public class func appLaunched() {
		let defaults = NSUserDefaults()
		
		if defaults.doubleForKey(FirstOpenDate) == 0 {
			let now = NSDate().timeIntervalSince1970
			defaults.setDouble(now, forKey: FirstOpenDate)
		}
		
		let useCount = defaults.integerForKey(UseCount)
		defaults.setInteger(useCount + 1, forKey: UseCount)
		
		if canShowPrompt() {
			dispatch_async(dispatch_get_main_queue(), {
				let topViewController = UIApplication.topViewController()
				
				let alert = UIAlertController(title: "Stop Trump.", message: "This election is extremely important, and as a country, we must not let a dangerous, bigoted, fraudulent man become the president. The two biggest ways to do your part is 1) register to vote and vote Hillary, and 2) donate to the Hillary campaign.", preferredStyle: .Alert)
				
				let donateAction = UIAlertAction(title: "Donate Now", style: .Default, handler: { (action) in
					let safariViewController = SFSafariViewController(URL: NSURL(string: "https://www.hillaryclinton.com/donate/?ref=ImWithHerPod")!)
					topViewController?.presentViewController(safariViewController, animated: true, completion: nil)
				})
				
				let noThanksAction = UIAlertAction(title: "Let Donald Trump Win", style: .Destructive, handler: { action in
					
					let safariViewController = SFSafariViewController(URL: NSURL(string: "https://www.hillaryclinton.com/donate/?ref=ImWithHerPod")!)
					topViewController?.presentViewController(safariViewController, animated: true, completion: nil)
				})
				
				alert.addAction(donateAction)
				alert.addAction(noThanksAction)
			
				topViewController?.presentViewController(alert, animated: true, completion: nil)
			})
		}
	}
	
	class func canShowPrompt() -> Bool {
		let defaults = NSUserDefaults()
		let useCount = defaults.integerForKey(UseCount)
		
		if useCount < usesUntilPrompt {
			return false
		}

		let calendar = NSCalendar.currentCalendar()
		let firstOpenDate = calendar.startOfDayForDate(NSDate(timeIntervalSince1970: defaults.doubleForKey(FirstOpenDate)))
		let now = calendar.startOfDayForDate(NSDate())
		
		let components = calendar.components(.Day, fromDate: firstOpenDate, toDate: now, options: .MatchFirst)
		
		if components.day < daysUntilPrompt {
			return false
		}
		
		return true
	}
}


extension UIApplication {
	class func topViewController(base: UIViewController? = UIApplication.sharedApplication().keyWindow?.rootViewController) -> UIViewController? {
		if let nav = base as? UINavigationController {
			return topViewController(nav.visibleViewController)
		}
		if let tab = base as? UITabBarController {
			if let selected = tab.selectedViewController {
				return topViewController(selected)
			}
		}
		if let presented = base?.presentedViewController {
			return topViewController(presented)
		}
		return base
	}
}
