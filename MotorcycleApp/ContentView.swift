//
//  ContentView.swift
//  MotorcycleApp
//
//  Created by Arief Ramadhan on 03/10/22.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            ScrollView{
                VStack(spacing: 20 ){
                    HomeHeader()
                    CustomDivider()
                    CarSection()
                    CustomDivider()
//                    CategoryView(title: "Quick Shortcut", showEdit: true, actionItems: QuickShortcut)
//                    CustomDivider()
//                    CategoryView(title: "Recent Actions", actionItems: RecentAction)
                    CustomDivider()
                    AllSettings()
                }
                .padding()
            }
            VoiceCommandButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .foregroundColor(.white)
    }
}

struct VoiceCommandButton: View {
    var body: some View{
        VStack{
            Spacer()
            HStack{
                Spacer()
                Image(systemName: "mic.fill")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .frame(width: 64, height: 64)
                    .background(Color("Green"))
                    .foregroundColor(Color("DarkGrey"))
                    .clipShape(Circle())
                    .padding()
                    .shadow(radius: 10)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeHeader: View{
    var body: some View{
        HStack{
            VStack(alignment: .leading, spacing: 10){
                Text("Model 3")
                    .font(.caption2)
                    .fontWeight(.medium)
                    .padding(.vertical,4)
                    .padding(.horizontal,8)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    .clipShape(Capsule())
                Text("Mach Five")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
            }
            Spacer()
            HStack{
                Button(action: {}){
                    GeneralButton(icon: "lock.fill")
                }
                Button(action: {}){
                    GeneralButton(icon: "gear")
                }
                
            }
        }
        .padding(.top)
    }
}

struct GeneralButton: View {
    
    var icon: String
    
    var body: some View{
        Image(systemName: icon)
            .imageScale(.large)
            .frame(width:44, height: 44)
            .background(Color.white.opacity(0.05))
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
            )
    }
}

struct CustomDivider: View {
    var body: some View{
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 0.25)
            .background(Color.white.opacity(0.1))
    }
}

struct CarSection: View {
    var body: some View{
        VStack(spacing: 20){
            HStack(alignment: .center) {
                HStack{
                    Image(systemName: "battery.75")
                    Text("237 miles".uppercased())
                }
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundColor(Color("Green"))
                Spacer()
                VStack(alignment: .trailing){
                    Text("Parked")
                        .fontWeight(.semibold )
                    Text("Last Update: 5 min ago")
                        .font(.caption2)
                        .foregroundColor(Color.gray)
                }
            }
            Image("ninja")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct CategoryHeader: View {
    
    var title: String
    var showEdit: Bool = false
    
    var body: some View{
        HStack(alignment: .center){
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            Spacer()
            if showEdit {
                Button(action: {}){
                    Text("Edit")
                        .foregroundColor(.gray )
                        .fontWeight(.medium)
                }
            }
        }
    }
}

struct CategoryView: View{
    
    var title: String
    var showEdit: Bool = false
    var actionItems: [ActionItem]
    
    var body: some View{
        CategoryHeader(title: title, showEdit: showEdit)
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .top){
                ForEach(actionItems, id:\.self) { item in
                    ActionButton(item: item)
                }
            }
        }
    }
}

struct ActionButton: View{
    
    var item: ActionItem
    
    var body: some View{
        VStack(alignment: .center){
            GeneralButton(icon: item.icon)
            Text(item.text)
                .frame(width: 72)
                .font(.system(size: 12, weight: .semibold, design: .default))
                .multilineTextAlignment(.center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ActionItem: Hashable {
    var icon: String
    var text: String
}

let QuickShortcut: [ActionItem] = [
ActionItem(icon: "bolt.fill", text: "Charging"), ActionItem(icon: "fanblades.fill", text: "Fan on"), ActionItem(icon: "playpause.fill", text: "Musik Controls"), ActionItem(icon: "bolt.car", text: "Close Charge Port")]

let RecentAction: [ActionItem] = [
ActionItem(icon: "arrow.up.square", text: "Open Trunk"), ActionItem(icon: "fanblades", text: "Fan off"), ActionItem(icon: "person.fill.viewfinder", text: "Summon")]


struct AllSettings: View {
    var body: some View{
        CategoryHeader(title: "All Settings")
        LazyVGrid(columns: [GridItem(.fixed(170))]){
            SettingBlock(icon: "car.fill", title: "Controls")
            SettingBlock(icon: "fanblades.fill", title: "Climate")
            SettingBlock(icon: "location.fill", title: "Location")
            SettingBlock(icon: "checkerboard.shield", title: "Security")
            SettingBlock(icon: "sparkles", title: "Upgrades")
        }
    }
}


struct SettingBlock: View{
    var icon: String
    var title: String
    var subtitile: String = ""
    var hasSubtitle: Bool = false
    
    var body: some View{
        HStack{
            Image(systemName: icon)
            VStack{
                Text(title)
                if hasSubtitle {
                    Text(subtitile)
                }
            }
        }
    }
}
