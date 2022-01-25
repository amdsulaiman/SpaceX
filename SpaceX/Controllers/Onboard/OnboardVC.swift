//
//  OnboardVC.swift
//  SpaceX
//
//  
//

import UIKit

class OnboardVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var onboardCollectionView: UICollectionView!
    @IBOutlet weak var getStartLbl: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var NextBtnRef: UIButton!
    
    var slides : [OnboardingSlide] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1
            {
                getStartLbl.text = "Get Started"
            }
            else
            {
                getStartLbl.text = "Next"
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NextBtnRef.layer.cornerRadius = 8
        onboardCollectionView.delegate = self
        onboardCollectionView.dataSource = self
        slides = [OnboardingSlide(title: "SpaceX Vision", description: "“You want to wake up in the morning and think the future is going to be great - and that’s what being a spacefaring civilization is all about. It’s about believing in the future and thinking that the future will be better than the past. And I can’t think of anything more exciting than going out there and being among the stars.”\n ~Elon Musk", image: #imageLiteral(resourceName: "slide1")),
                  OnboardingSlide(title: "MAKING HUMANITY MULTIPLANETARY", description: "Building on the achievements of Falcon 9 and Falcon Heavy, SpaceX is working on a next generation of fully reusable launch vehicles that will be the most powerful ever built, capable of carrying humans to Mars and other destinations in the solar system.", image: #imageLiteral(resourceName: "slide2")),
                  OnboardingSlide(title:  "MAKING HISTORY", description: "SpaceX has gained worldwide attention for a series of historic milestones. It is the only private company capable of returning a spacecraft from low-Earth orbit, and in 2012 our Dragon spacecraft became the first commercial spacecraft to deliver cargo to and from the International Space Station. And in 2020, SpaceX became the first private company to take humans there as well. Click through the timeline above to see some of our milestone accomplishments.", image: #imageLiteral(resourceName: "slide3")), OnboardingSlide(title: "REUSABILITY", description: "SpaceX believes a fully and rapidly reusable rocket is the pivotal breakthrough needed to substantially reduce the cost of space access. The majority of the launch cost comes from building the rocket, which historically has flown only once.While most rockets are designed to burn up on reentry, SpaceX rockets can not only withstand reentry but can also successfully land back on Earth and refly again.", image: #imageLiteral(resourceName: "slide4"))
        ]
        if UserDefaults.standard.bool(forKey: "ISLOGGEDIN") == true {
            let story = UIStoryboard(name: "Main", bundle:nil)
            let vc = story.instantiateViewController(withIdentifier: "TabbarVC") as! UITabBarController
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            
        }

    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func nextBtnAction(_ sender: UIButton) {
        if currentPage == slides.count - 1{
            let vc = storyboard?.instantiateViewController(identifier: "TabbarVC") as! UITabBarController
            vc.modalPresentationStyle = .fullScreen
           // UserDefaults.standard.set(true, forKey: "ISLOGGEDIN")
            self.present(vc, animated: true)

        }
        else {
            currentPage += 1
            let indexpath = IndexPath(item: currentPage, section:0)
            onboardCollectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onboardCollectionView.dequeueReusableCell(withReuseIdentifier: "OnboardCollectionViewCell", for: indexPath) as! OnboardCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: onboardCollectionView.frame.size.width, height:  onboardCollectionView.frame.size.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        
    }
    
}
