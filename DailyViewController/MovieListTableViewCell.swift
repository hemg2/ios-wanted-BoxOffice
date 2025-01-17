//
//  MovieListTableViewCell.swift
//  BoxOffice
//
//  Created by 1 on 2022/10/17.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var audienceLabel: UILabel!  // 관객
    @IBOutlet weak var openingDateLabel: UILabel!
    @IBOutlet weak var newRankingLabel: UILabel!
    @IBOutlet weak var comparedToYesterdayLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    
    func setModel(model: MovieInfost) {
        rankingLabel.text = model.rank
        movieTitleLabel.text = "제목: \(model.movieNm)"
        audienceLabel.text = "관객수: \(model.audiAcc)명"
        openingDateLabel.text = "개봉일: \(model.openDt)"
        if model.rankOldAndNew == "OLD" {
            newRankingLabel.text = " "
        } else {
            newRankingLabel.text = "NEW"
        }
        if model.rankInten == "0" {
            comparedToYesterdayLabel.text = "-"
            countLabel.text = " "
        } else if model.rankInten >= "0" {
            countLabel.text = "▲"
            countLabel.textColor = .red
            comparedToYesterdayLabel.text = model.rankInten
        } else {
            countLabel.text = "▼"
            countLabel.textColor = .blue
            comparedToYesterdayLabel.text = model.rankInten
        }
    }
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        rankingLabel.textColor = .black
        movieTitleLabel.textColor = rankingLabel.textColor
        audienceLabel.textColor = rankingLabel.textColor
        openingDateLabel.textColor = rankingLabel.textColor
        newRankingLabel.textColor = rankingLabel.textColor
        comparedToYesterdayLabel.textColor = rankingLabel.textColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
