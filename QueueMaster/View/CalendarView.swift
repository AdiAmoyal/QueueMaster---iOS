//
//  CalendarView.swift
//  QueueMaster
//
//  Created by Adi Amoyal on 28/02/2023.
//

import SwiftUI

struct CalendarView: View {
    @State private var currentDay: Date = .init()
    @State private var tasks: [Task] = sampleTasks
    
    var body: some View {
        ScrollViewReader { proxy in
            let hours = Calendar.current.hours
            let midHour = hours[hours.count / 2]
            
            VStack {
                ForEach(hours, id: \.self) { hour in
                    CalendarViewRow(hour)
                        .id(hour)
                }
            }
            .onAppear {
                proxy.scrollTo(midHour)
            }
        }
        .padding(15)
    }
    
    @ViewBuilder
    func CalendarViewRow(_ date: Date) -> some View {
        HStack(alignment: .top) {
            Text(date.toString("h a"))
            
            // Filtering Tasks
            let calendar = Calendar.current
            let filteredTasks = tasks.filter {
                if let hour = calendar.dateComponents([.hour], from: date).hour,
                   let taskHour = calendar.dateComponents([.hour], from: $0.dateAdded).hour,
                   hour == taskHour && calendar.isDate($0.dateAdded, inSameDayAs: currentDay) {
                    return true
                }
                return false
            }
            
            if filteredTasks.isEmpty {
                Rectangle()
                    .stroke(.gray.opacity(0.5), style: StrokeStyle(lineWidth: 0.5, lineCap: .butt, lineJoin: .bevel, dash: [5], dashPhase: 5))
                    .frame(height: 0.5)
                    .offset(y: 10)
            } else {
                VStack(spacing: 10) {
                    ForEach(filteredTasks){task in
                        TaskView(task)
                    }
                }
            }
        }
        .hAlign(.leading)
        .padding(.vertical, 12)
    }
    
    @ViewBuilder
    func TaskView(_ task: Task)->some View{
        VStack(alignment: .leading, spacing: 8) {
            Text(task.taskName.uppercased())
                .foregroundColor(task.taskCategory.color)
                .lineLimit(1)
            
            if task.taskDescription != ""{
                Text(task.taskDescription)
                    .foregroundColor(task.taskCategory.color.opacity(0.8))
                    .lineLimit(6)
            }
        }
        .hAlign(.leading)
        .padding(12)
        .background {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(task.taskCategory.color)
                    .frame(width: 4)
                
                Rectangle()
                    .fill(task.taskCategory.color.opacity(0.25))
            }
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

