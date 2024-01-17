import UIKit

class ProgressController: WABaseController { }

  
private let dailyPerfomanceView = DailyPerfomanceView(with: Resources.Strings.Progress.dailyPerformance,
                                                      buttonTitle: Resources.Strings.Progress.last7Days)

private let monthlyPerfomanceView = MonthlyPerfomanceView(with: Resources.Strings.Progress.monthlyPerformance,
                                                    buttonTitle: Resources.Strings.Progress.last10Months)

extension ProgressController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(dailyPerfomanceView)
        view.setupView(monthlyPerfomanceView)

    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            dailyPerfomanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerfomanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerfomanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerfomanceView.heightAnchor.constraint(equalTo: dailyPerfomanceView.widthAnchor, multiplier: 0.68),
            
            monthlyPerfomanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            monthlyPerfomanceView.topAnchor.constraint(equalTo: dailyPerfomanceView.bottomAnchor, constant: 15),
            monthlyPerfomanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            monthlyPerfomanceView.heightAnchor.constraint(equalTo: monthlyPerfomanceView.widthAnchor, multiplier: 1.06)
      
        ])
    }
    
    override func configureAppearance(){
        super.configureAppearance()
        
        title = Resources.Strings.NavBar.progress
        navigationController?.tabBarItem.title = Resources.Strings.TabBar.title(for: .progress)
 
        addNavBarButton(at: .left, with: Resources.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with:Resources.Strings.Progress.navBarRight)
        
        dailyPerfomanceView.configure(with: [.init(value: "1", heightMultiplier: 0.2, title: "Mon"),
                                             .init(value: "2", heightMultiplier: 0.4, title: "Teu"),
                                             .init(value: "3", heightMultiplier: 0.6, title: "Wen"),
                                             .init(value: "4", heightMultiplier: 0.8, title: "Thu"),
                                             .init(value: "5", heightMultiplier: 1, title: "Fri"),
                                             .init(value: "3", heightMultiplier: 0.6, title: "Sat"),
                                             .init(value: "2", heightMultiplier: 0.4, title: "Sun")])

        monthlyPerfomanceView.configure(with: [.init(value: 45, title: "Mar"),
                                               .init(value: 55, title: "Apr"),
                                               .init(value: 60, title: "May"),
                                               .init(value: 65, title: "Jun"),
                                               .init(value: 70, title: "Jul"),
                                               .init(value: 80, title: "Aug"),
                                               .init(value: 65, title: "Sep"),
                                               .init(value: 45, title: "Oct"),
                                               .init(value: 30, title: "Nov"),
                                               .init(value: 15, title: "Dec")], topChartOffset: 10
        )
    }
}
