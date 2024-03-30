
import SwiftUI

struct ContentView: View {
  
  @State private var isNight = false
  
  var body: some View {
    HStack {
      ZStack {
        BackgroundView(isNight: $isNight)
        
        VStack {
          CityTextView(cityName: isNight ? "Apni Delhi ki Raat" : "Apni Delhi ki Subh")
          
          MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 79)
          
          HStack(spacing: 20) {
            WeatherDayView(dayOfWeek: "TUE",
                           imageName: "cloud.sun.fill",
                           temperature: 80)
            
            WeatherDayView(dayOfWeek: "WED",
                           imageName: "cloud.sun.fill",
                           temperature: 78)
            
            WeatherDayView(dayOfWeek: "THU",
                           imageName: "snow",
                           temperature: 20)
            
            WeatherDayView(dayOfWeek: "FRI",
                           imageName: "snow",
                           temperature: 25)
          }
          
          Spacer()
          
          Button {
            isNight.toggle()
          } label: {
            WeatherButton(title: "Change Mode", textColor: .blue, backgroundColor: .white)
          }
          
          Spacer()
        }
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct WeatherDayView: View {
  var dayOfWeek: String
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack() {
      Text(dayOfWeek)
        .font(.system(size: 16, weight: .medium))
        .foregroundColor(.white)
      
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
      
      Text("\(temperature)°")
        .font(.system(size: 28, weight: .medium))
        .foregroundColor(.white)
    }
  }
}

struct BackgroundView: View {
  @Binding var isNight: Bool
  
  var body: some View {
    LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                               isNight ? .gray : Color("lightBlue")]),
                   startPoint: .topLeading,
                   endPoint: .bottomLeading)
      .edgesIgnoringSafeArea(.all)
  }
}

struct CityTextView: View {
  var cityName: String
  
  var body: some View {
    Text(cityName)
      .font(.system(size: 32, weight: .medium, design: .default))
      .foregroundColor(.white)
      .padding()
  }
}

struct MainWeatherStatusView: View {
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack(spacing: 0) {
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 180, height: 180)
      
      Text("\(temperature)°")
        .font(.system(size: 70, weight: .medium))
        .foregroundColor(.white)
    }
    .padding(.bottom, 40)
  }
}

