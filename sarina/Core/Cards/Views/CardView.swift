//
//  CardView.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 7/24/24.
//

import SwiftUI

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardsViewModel
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    
    @State private var mockImages = [
        "therock",
        "therock1",
        "therock2"
    ]
    
    let model: CardModel
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top){
                Image(user.profileImageURLs[currentImageIndex]).resizable().scaledToFill()
                    .overlay {
                        ImageScrollOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
            ImageInfoView(user: user).padding(.horizontal)
        }.frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight).clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(x: xOffset)
            .rotationEffect(.degrees(degrees))
            .animation(.snappy, value: xOffset)
            .gesture(
                DragGesture().onChanged(onDragChanged).onEnded(onDragEnded)
            )
    }
}

private extension CardView {
    var user: User {
        return model.user
    }
    var imageCount: Int {
        return user.profileImageURLs.count
    }
}

private extension CardView {
    func returnToCenter(){
        xOffset = 0
        degrees = 0
    }
    func SwipeRight(){
        withAnimation {
            xOffset = 500
            degrees = 12
        } completion: {
            viewModel.removeCard(model)
        }

    }
    func SwipeLeft(){
        withAnimation {
            xOffset = -500
            degrees = -12
        } completion: {
            viewModel.removeCard(model)
        }
    }
}
private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        if width >= SizeConstants.screenCutoff {
            SwipeRight()
        }else{
            SwipeLeft()
        }
    }
}

#Preview {
    CardView(
        viewModel: CardsViewModel(
            service: CardService()
        ),
        model: CardModel(
            user: MockData.users[1]
        )
    )
}

