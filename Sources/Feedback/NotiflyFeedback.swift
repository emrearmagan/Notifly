//
//  NotiflyFeedback.swift
//  Notifly
//
//  Created by Emre Armagan on 03.01.25.
//  Copyright © 2025 Emre Armagan. All rights reserved.
//

import UIKit

/// Enum to define haptic feedback for notifications.
public enum NotiflyFeedback {
    /// No haptic feedback.
    case none

    /// Predefined impact feedback using `UIImpactFeedbackGenerator`.
    case impact(style: UIImpactFeedbackGenerator.FeedbackStyle)

    /// Selection feedback using `UISelectionFeedbackGenerator`.
    case selection

    /// Notification feedback using `UINotificationFeedbackGenerator`.
    case notification(type: UINotificationFeedbackGenerator.FeedbackType)

    /// Custom feedback generator provided by the user.
    case custom(generator: NotiflyFeedbackGenerator)

    /// Executes the feedback.
    public func generate() {
        switch self {
            case .none:
                // No feedback
                break

            case let .impact(style):
                let generator = UIImpactFeedbackGenerator(style: style)
                generator.prepare()
                generator.impactOccurred()

            case .selection:
                let generator = UISelectionFeedbackGenerator()
                generator.prepare()
                generator.selectionChanged()

            case let .notification(type):
                let generator = UINotificationFeedbackGenerator()
                generator.prepare()
                generator.notificationOccurred(type)

            case let .custom(generator):
                generator.generateFeedback()
        }
    }
}
