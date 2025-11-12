//
//  HomeTabContent.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 11.11.2025.
//

import SwiftUI

struct HomeTabContent<ViewModel: HomeScreenViewModelProtocol>: View {
  @ObservedObject var viewModel: ViewModel
  
  var body: some View {
    if viewModel.isLoading {
      ProgressView()
    } else {
      Text("Am descarcat \(viewModel.pages.count) pagini de anime-uri")
    }
  }
}
