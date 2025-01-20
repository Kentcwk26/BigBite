import SwiftUI

struct ContentView: View {
    @State private var isEntered = false // Track if the user tapped Enter
    
    var body: some View {
        ZStack {
            if isEntered {
                // Main Content View when button is tapped
                HomeView() // This is where you show the content
                    .transition(.opacity) // Fade in for smooth transition
                    .animation(.easeInOut(duration: 0.5))
            } else {
                // Landing Page Content (Welcome message + Enter Button)
                landingPage
                    .transition(.opacity) // Fade in for smooth transition
                    .animation(.easeInOut(duration: 0.5))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var landingPage: some View {
        VStack(spacing: 30) {
            
            // Food-related icon
            Image(systemName: "cart.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .foregroundColor(.white)
                .shadow(radius: 10)
            
            // Welcome message
            Text("Welcome to Food Ordering Management System")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding()
            
            // Enter button
            Button(action: {
                // On button tap, navigate to the content page
                withAnimation {
                    isEntered = true
                }
            }) {
                Text("Enter")
                    .font(.title2)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.9))
                    .foregroundColor(.black)
                    .cornerRadius(12)
                    .shadow(radius: 5)
            }
            .padding(.horizontal, 40)
        }
    }
}

struct HomeView: View {
    var body: some View {
        NavigationView { // Wrap HomeView
            VStack(spacing: 20) {
                Text("Welcome using BigBite App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                // Replace the sidebar with a List of NavigationLinks
                List {
                    NavigationLink(destination: FoodMenuView()) {
                        HStack {
                            Image(systemName: "menucard.fill") // SF Symbol for menu
                            Text("Browse Menu")
                        }
                    }
                    
                    NavigationLink(destination: SettingsView()) {
                        HStack {
                            Image(systemName: "gearshape.fill") // SF Symbol for settings
                            Text("Settings")
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle()) // Modern list style
            }
        }
    }
}

struct FoodMenuView: View {
    var body: some View {
        VStack {
            Text("Food Menu Coming Soon...")
                .font(.title)
                .padding()
        }
        .navigationTitle("Food Menu") // Ensure navigation title is set
    }
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings Page Coming Soon...")
                .font(.title)
                .padding()
        }
        .navigationTitle("Settings") // Ensure navigation title is set
    }
}
