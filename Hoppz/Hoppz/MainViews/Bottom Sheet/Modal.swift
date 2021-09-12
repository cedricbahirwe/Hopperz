//
//  Modal.swift
//  Hoppz
//
//  Created by Cédric Bahirwe on 12/09/2021.
//

import SwiftUI

enum ModalState: CGFloat {
    
    case closed ,partiallyRevealed, open
    
    func offsetFromTop() -> CGFloat {
        switch self {
        case .closed:
            return UIScreen.main.bounds.height * 0.89
//            return UIScreen.main.bounds.heightg
        case .partiallyRevealed:
            return UIScreen.main.bounds.height * 0.89
        case .open:
            return 0
        }
    }
}

struct Modal {
    var position: ModalState  = .closed
    var dragOffset: CGSize = .zero
    var content: AnyView?
}


struct ModalAnchorView: View {
    
    @EnvironmentObject var modalManager: ModalManager
    
    var body: some View {
        VStack {
            ModalView(modal: $modalManager.modal)

        }
        .onAppear() {
            modalManager.newModal(position: .partiallyRevealed) {
                exploreView
            }
        }
    }
    
    private var exploreView: some View {
        VStack(alignment: .leading) {
            Text("Explore")
                .font(.largeTitle.weight(.semibold))
                .opacity(0.9)
                .padding(.vertical)
            Text("No Establishments Nearby").bold()
                .padding()
                .frame(maxWidth: .infinity)
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(0 ..< 5) { item in
                        HStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .padding(5)
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                                .clipShape(Circle())
                                .overlay(Circle().strokeBorder(Color.green, lineWidth: 1))
                            
                            VStack(alignment: .leading) {
                                Text("Cedric Bahirwe").bold()
                                    .foregroundColor(.green)
                                
                                Text("MIT University")
                                    .font(.caption)
                                
                            }
                            Spacer()
                            
                            Label(
                                title: {
                                    Text("\((500...15000).randomElement()!)")
                                        .foregroundColor(.green)
                                },
                                icon: {
                                    Image(systemName: "42.circle")
                                        .imageScale(.large)
                                        .foregroundColor(.yellow)
                                }
                            )
                        }
                        .padding(.vertical, 10)
                        .overlay(Color.gray.frame(height: 1), alignment: .bottom)
                    }
                }
            }
        }
        .padding(10)
        .padding(.top, 45)
    }
}


class ModalManager: ObservableObject {
    
    @Published var modal: Modal = Modal(position: .partiallyRevealed, content: nil)
    
    func newModal<Content: View>(position: ModalState, @ViewBuilder content: () -> Content ) {
        modal = Modal(position: position, content: AnyView(content()))
    }
    
    func openModal() {
        modal.position = .partiallyRevealed
    }
    
    func closeModal() {
        modal.position = .closed
    }
    
}


struct ModalView: View {
    
    // Modal State
    @Binding var modal: Modal
    @GestureState var dragState: DragState = .inactive
    
    var animation: Animation {
        Animation
            .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0)
            .delay(0)
    }
    
    var body: some View {
        
        let drag = DragGesture(minimumDistance: 30)
            .updating($dragState) { drag, state, transaction in
                state = .dragging(translation:  drag.translation)
        }
        .onChanged {
            self.modal.dragOffset = $0.translation
        }
        .onEnded(onDragEnded)
        
        return GeometryReader(){ geometry in
            ZStack(alignment: .top) {
                ZStack(alignment: .top) {
                    Color(.secondarySystemBackground)
                    modal.content
                        .frame(height: UIScreen.main.bounds.height - (modal.position.offsetFromTop() + geometry.safeAreaInsets.top + dragState.translation.height))
                }
                .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .offset(y: max(0, modal.position.offsetFromTop() + dragState.translation.height + geometry.safeAreaInsets.top))
                .gesture(drag)
                .animation(dragState.isDragging ? nil : animation)
            }
        }
        .ignoresSafeArea()
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        
        // Setting stops
        let higherStop: ModalState
        let lowerStop: ModalState
        
        // Nearest position for drawer to snap to.
        let nearestPosition: ModalState
        
        // Determining the direction of the drag gesture and its distance from the top
        let dragDirection = drag.predictedEndLocation.y - drag.location.y
        let offsetFromTopOfView = modal.position.offsetFromTop() + drag.translation.height
        
        // Determining whether drawer is above or below `.partiallyRevealed` threshold for snapping behavior.
        if offsetFromTopOfView <= ModalState.partiallyRevealed.offsetFromTop() {
            higherStop = .open
            lowerStop = .partiallyRevealed
        } else {
            higherStop = .partiallyRevealed
            lowerStop = .closed
        }
        
        // Determining whether drawer is closest to top or bottom
        if (offsetFromTopOfView - higherStop.offsetFromTop()) < (lowerStop.offsetFromTop() - offsetFromTopOfView) {
            nearestPosition = higherStop
        } else {
            nearestPosition = lowerStop
        }
        
        // Determining the drawer's position.
        if dragDirection > 0 {
            modal.position = lowerStop
        } else if dragDirection < 0 {
            modal.position = higherStop
        } else {
            modal.position = nearestPosition
        }
        
    }
    
}

enum DragState {
    
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
