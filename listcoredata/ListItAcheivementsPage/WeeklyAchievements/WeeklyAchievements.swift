//
//  WeeklyAchievements.swift
//  ListItAcheivementsPage
//
//  Created by Reem Alkhatib on 20/12/2022.
//

import SwiftUI

struct WeeklyAchievements: View {
    @ObservedObject var viewModel = WeeklyAchievementsModel()
    
    var body: some View {
    
            VStack(alignment: .center){
                HStack
                {
                    VStack{
                        
                        HStack(spacing: 20){
                            
                            Image(systemName: "trophy.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30 , height: 30)
                                .foregroundColor(Color("gold"))
                            Text("80%").fontWeight(.bold).font(.system(size: 30))
                                .padding(.trailing, 90)
                        }
                        
                        
                        
                        Text("You have finished 12 lists this week !")
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                        
                        
                    }
                    Image("man")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100 , height: 100)
                }
                .frame(width: 341, height: 153)
                .background(Color.white)
                .cornerRadius(10)
                .shadow( color: .gray.opacity(0.3) , radius: 5, x: 1, y: 0 )
                
                
                VStack{
                    Text("Acheivements")
                        .frame(width: 350, height: 30, alignment: .leading)
                        .font(Font.custom("SFProRounded", size: 20).weight(Font.Weight.medium))
                    
                    
                    Divider()
                    VStack{
                        HStack{
                            LightningPage()
                            NumberOne()
                            Achiever()
                            
                        }
                        
                        HStack{
                            TheFastest()
                        ForEach(viewModel.secRowOfWeekly)
                            {
                                Achievements in
                                VStack{
                                    Achievements.achievemetSymbol
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    
                                    Text(Achievements.acheivementName)
                                        .font(Font.custom("SFProRounded", size: 11))
                                        .foregroundColor(Color.black)
                                    Text(Achievements.achievementDescription)
                                        .foregroundColor(Color.gray)
                                        .font(Font.custom("SFProRounded", size: 11))
                                        .opacity(0.5)
                                        .frame(width : 100)
                                        .multilineTextAlignment(.center)
                                }
                            }
                            
                    }
                        HStack{
                        ForEach(viewModel.thirdRowOfWeekly)
                            {
                                Achievements in
                                VStack{
                                    Achievements.achievemetSymbol
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    
                                    Text(Achievements.acheivementName)
                                        .font(Font.custom("SFProRounded", size: 11))
                                        .foregroundColor(Color.black)
                                    Text(Achievements.achievementDescription)
                                        .foregroundColor(Color.gray)
                                        .font(Font.custom("SFProRounded", size: 11))
                                        .opacity(0.5)
                                        .frame(width : 100)
                                        .multilineTextAlignment(.center)
                                }
                            }
                           
                    }
                    }
                    
                
                
                
            }
        }.padding(10)
    }
    
}
struct WeeklyAchievements_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyAchievements()
    }
}
