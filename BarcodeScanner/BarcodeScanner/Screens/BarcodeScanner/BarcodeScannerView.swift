//
//  ContentView.swift
//  BarcodeScannerApp
//
//  Created by Bob Coleman on 2/28/23.
//

import SwiftUI

struct BarcodeScannerView: View {
    
    @StateObject var viewModel = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    ScannerView(scannedCode: $viewModel.scannedCode, alertItem: $viewModel.alertItem)
                        .frame(maxHeight: 300)
                    
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 350, height: 2)
                        
                    
                }
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(viewModel.statusText)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(viewModel.statusTextColor)
                    .padding()

            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
